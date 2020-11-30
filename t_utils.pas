unit t_utils;

interface

uses dialogs, sysutils, ExcelXP, OleServer, ComObj, Variants, Ora, clipbrd;

var
  OracleQuery_1 : TOraQuery;
  OracleQuery_2 : TOraQuery;
  OracleQuery_3 : TOraQuery;
  OracleQuery_4 : TOraQuery;

function custom_ReplaceStr(source, p, r : string) : string;

procedure Show_TTRTN_Details(date_filter_month : string; date_filter_year : string; main_nomen : boolean);
procedure main_nomenclature_list(t : string; s : string; c : string);
procedure Show_Deficit_MainNomen;
procedure SP_DetailsTree(id : string; isTexkompl : boolean);
function parseResult(FExcel : OleVariant; Query : TOraQuery; (*QueryIndex : integer;*) index : integer) : integer;

var
  QueryIndex : integer;
  QueryS : array[1..4] of TOraQuery;

implementation

uses Unit1, Unit9;              

procedure DBSession_construct();
begin
  OracleQuery_1 := TOraQuery.Create(nil);
  OracleQuery_1.ReadOnly := true;
  OracleQuery_1.FetchAll := true; //TODO
  OracleQuery_1.Session := Form1.OraSession1;

  OracleQuery_2 := TOraQuery.Create(nil);
  OracleQuery_2.ReadOnly := true;
  OracleQuery_2.FetchAll := true; //TODO
  OracleQuery_2.Session := Form1.OraSession1;

  OracleQuery_3 := TOraQuery.Create(nil);
  OracleQuery_3.ReadOnly := true;
  OracleQuery_3.FetchAll := true; //TODO
  OracleQuery_3.Session := Form1.OraSession1;

  OracleQuery_4 := TOraQuery.Create(nil);
  OracleQuery_4.ReadOnly := true;
  OracleQuery_4.FetchAll := true; //TODO
  OracleQuery_4.Session := Form1.OraSession1;

  OracleQuery_1.SQL.Text := '';
  OracleQuery_1.Close;

  OracleQuery_2.SQL.Text := '';
  OracleQuery_2.Close;

  OracleQuery_3.SQL.Text := '';
  OracleQuery_3.Close;

  OracleQuery_4.SQL.Text := '';
  OracleQuery_4.Close;
end;

procedure DBSession_destruct();
begin
  OracleQuery_1.Close;
  OracleQuery_1.Free;
  
  OracleQuery_2.Close;
  OracleQuery_2.Free;

  OracleQuery_3.Close;
  OracleQuery_3.Free;

  OracleQuery_4.Close;
  OracleQuery_4.Free;
end;

function parseResult(FExcel : OleVariant; Query : TOraQuery; index : integer) : integer;
var SQL, sType, sname, poz, mass, kol : string; treeDown : boolean; treeDownQuery : TOraQuery;
begin
  while not Query.Eof do
  begin
    //showMessage(inttostr(index));
    sType := Query.FieldByName('type').asString;
    //showmessage(sType);
    sname := Query.FieldByName('name').asString;
    //showmessage('name = ' + sname + '; i = ' + inttostr(Query.RecNo) + '/' + inttostr(Query.RecordCount) + '; SQL = ' + Query.SQL.Text);
    poz := Query.FieldByName('poz').asString;
    mass := Query.FieldByName('mass').asString;
    kol := Query.FieldByName('kol').asString;
    
    treeDown := false;
    if (sType <> '') and (strtoInt(sType) > 0)  then
    begin
      index := (index + 2);      
      
      //showmessage('head');

      FExcel.Cells[index, 5].value := sname;
      FExcel.Cells[index, 5].Font.Bold := True;
      FExcel.Cells[index, 5].Font.Size := 16;
      FExcel.Cells[index, 5].HorizontalAlignment := xlCenter;
      FExcel.Cells[index, 5].VerticalAlignment := xlCenter;
      FExcel.Cells[index, 5].WrapText := true;
      FExcel.Cells[index, 6].value := poz;

      index := (index + 2);

      treeDown := true;
    end           
    else
    if  sType = '' then
    begin                   
      inc(index);

      //showmessage('title');

      //showMessage(inttostr(AnsiPos('труба', AnsiLowerCase('Труба 57X5 ГОСТ8732-78/B10 ГОСТ8731-74'))));

      if AnsiPos('труба', AnsiLowerCase(sname)) <> 0 then
      begin
        sname := sname + ' ' + kol;
        kol := '1';
      end;

      FExcel.Cells[index, 4].value := mass;
      FExcel.Cells[index, 5].value := sname;
      FExcel.Cells[index, 5].Font.Bold := true;
      FExcel.Cells[index, 5].Font.Size := 12;
      FExcel.Cells[index, 5].WrapText := true;
      FExcel.Cells[index, 5].VerticalAlignment := xlCenter;
      FExcel.Cells[index, 5].HorizontalAlignment := xlLeft;
      FExcel.Cells[index, 6].value := poz;
      FExcel.Cells[index, 7].value := kol;

      inc(index);
      
      treeDown := true;
    end
    else
    //if (strtoInt(sType) = -1) then
    begin                
      //showmessage('single');

      if AnsiPos('труба', AnsiLowerCase(sname)) <> 0 then
      begin
        sname := sname + ' ' + kol;
        kol := '1';
      end;               
      
      FExcel.Cells[index, 4].value := mass;
      FExcel.Cells[index, 5].value := sname;
      FExcel.Cells[index, 5].Font.Bold := false;
      FExcel.Cells[index, 5].Font.Size := 12;
      FExcel.Cells[index, 5].WrapText := true;
      FExcel.Cells[index, 5].HorizontalAlignment := xlLeft;
      FExcel.Cells[index, 5].VerticalAlignment := xlCenter;
      FExcel.Cells[index, 6].value := poz;
      FExcel.Cells[index, 7].value := kol;

      inc(index);

      treeDown := false; //?
    end;

    if treeDown then
    begin
      treeDownQuery := TOraQuery.Create(nil);
      treeDownQuery.ReadOnly := true;
      treeDownQuery.FetchAll := true; //TODO
      treeDownQuery.Session := Form1.OraSession1;

      SQL := 'Select sp.nn as id, sp.type_str as type, sp.name, sp.poz, sp.mass, sp.kol from tronix.sp sp where sp.up_nn = '
      + Query.FieldByName('id').asString + ' ORDER BY KART_Name_from_PozSP(sp.nn), upper(sp.PODPOZ)';
      form1.execQuery(treeDownQuery, SQL, true);

      if treeDownQuery.RecordCount <> 0 then
        index := (parseResult(FExcel, treeDownQuery, index));

      treeDownQuery.Close;
      treeDownQuery.Free;
      //FreeAndNil(treeDownQuery);
    end;

    Query.next;
  end;

  parseResult := index;
end;

procedure SP_DetailsTree(id : string; isTexkompl : boolean);
var
FExcel, Sheet : OleVariant;
SQL : string;
startIndex, index : integer;
begin
  FExcel := CreateOleObject('Excel.Application');
  FExcel.EnableEvents := False;
  FExcel.Visible := false;

  FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_DOC_SP_MAT.xls');
  FExcel.Workbooks[1].WorkSheets[1].Name := 'Раскрытие позиций';
  Sheet := FExcel.Workbooks[1].WorkSheets['Раскрытие позиций'];
  
  DBSession_construct();

  QueryS[1] := OracleQuery_1;
  QueryS[2] := OracleQuery_2;
  QueryS[3] := OracleQuery_3;
  QueryS[4] := OracleQuery_4;
  QueryIndex := 1;

  startIndex := 10;
  index := startIndex;

  if isTexkompl then
  begin
     (*
     SQL := 'select sp.nn as id, sp.type_str as type, sp.name, sp.poz, sp.mass, sp.kol from kart_sp sp, (select sp_sp_id as sp_id, '
     + 'tex_texkompl_id as texkompl_id from nordsy.tx_mat where tex_texkompl_id in (select texkompl_id from tx_texkompl '
     + 'connect by prior texkompl_id = texkompl_texkompl_id start with texkompl_id = ' + ID +') and sp_sp_id is not null) tx where tx.sp_id = sp.nn(+) '
     + 'ORDER BY tx.texkompl_id, TO_NUMBER(replace(replace(sp.poz, ' + char(39) + '-' + char(39) + '), ' + char(39) + '.' + char(39) + ')) ASC';
     *)
     SQL := 'select sp.nn as id, sp.type_str as type, sp.name, sp.poz, sp.mass, sp.kol from kart_sp sp, (select sp_sp_id as sp_id, '
     + 'tex_texkompl_id as texkompl_id from nordsy.tx_mat where tex_texkompl_id in (select texkompl_id from tx_texkompl '
     + 'connect by prior texkompl_id = texkompl_texkompl_id start with texkompl_id = ' + ID +') and sp_sp_id is not null) tx where tx.sp_id = sp.nn(+) '
     + 'ORDER BY tx.texkompl_id, KART_Name_from_PozSP(sp.nn), upper(sp.PODPOZ)';
     form1.execQuery(QueryS[QueryIndex], SQL, false);

     if QueryS[QueryIndex].RecordCount = 0 then
     begin
        DBSession_destruct();
        FExcel := Unassigned;
        showMessage('По выбранной ПУЕ - отсуствуют записи!');
        exit;
     end;                        
  end
  else
  begin
    (*
    SQL := 'Select sp.nn as id, sp.type_str as type, sp.name, sp.poz, sp.mass, sp.kol from kart_sp sp where sp.nnn = ' + id + ' and sp.type_str is not null '
    + 'and sp.type_str > 0 and UP_NN is not null  ORDER BY TO_NUMBER(replace(replace(sp.poz, ' + char(39) + '-' + char(39) + '), ' + char(39) + '.' + char(39) + ')) ASC';
    *)
    SQL := 'Select sp.nn as id, sp.type_str as type, sp.name, sp.poz, sp.mass, sp.kol from kart_sp sp where sp.nnn = ' + id
    + ' and UP_NN is null ORDER BY KART_Name_from_PozSP(sp.nn), upper(sp.PODPOZ)';
    form1.execQuery(QueryS[QueryIndex], SQL, false);

    index := (index - 2);

    (*
    if QueryS[QueryIndex].RecordCount = 0 then
    begin
      SQL := 'Select sp.nn as id, sp.type_str as type, sp.name, sp.poz, sp.mass, sp.kol from kart_sp sp where sp.nnn = ' + id + ' and sp.type_str is null '
      + 'ORDER BY TO_NUMBER(replace(replace(sp.poz, ' + char(39) + '-' + char(39) + '), ' + char(39) + '.' + char(39) + ')) ASC';
      form1.execQuery(QueryS[QueryIndex], SQL, false);

      index := (index + 2);

      if QueryS[QueryIndex].RecordCount = 0 then
      begin
        SQL := 'Select sp.nn as id, sp.type_str as type, sp.name, sp.poz, sp.mass, sp.kol from kart_sp sp where sp.nnn = ' + id + ' and sp.type_str is not '
        + 'null and sp.type_str = -1 ORDER BY TO_NUMBER(replace(replace(sp.poz, ' + char(39) + '-' + char(39) + '), ' + char(39) + '.' + char(39) + ')) ASC';
        form1.execQuery(QueryS[QueryIndex], SQL, false);

        if QueryS[QueryIndex].RecordCount = 0 then
        begin
          DBSession_destruct();
          showmessage('По выбранной спецификации - отсутствуют записи!');
          exit;
        end;
      end;
    end;
    *)

  end;
  
  index := parseResult(FExcel, QueryS[QueryIndex], index);
  Sheet.Range[Sheet.Cells[startIndex, 1], Sheet.Cells[index - 1, 17]].borders.linestyle := xlContinuous;

  DBSession_destruct();

  FExcel.Visible := true;

  //FExcel.quit;
  FExcel := Unassigned;
end;

procedure Show_TTRTN_Details(date_filter_month : string; date_filter_year : string; main_nomen : boolean);
const
DD_MASK = char(39) + 'DD' + char(39);
MM_MASK = char(39) +  'MM' + char(39);
DM_MASK = char(39) + 'mm.YYYY' + char(39);
TYPE_TTN_ARRAY = '5, 44';
var
SQL: string;
FExcel, Sheet : OleVariant;
startNum, strNum : integer;
begin

  (*
  D_YEAR := '';
  D_YEAR := InputBox('ОТЧЕТ', 'Введите год; формат: 1999, 2005, 2015, 2020...', '');
  if ((D_YEAR = '') or (length(D_YEAR) > 4)) then
  begin
    showmessage('Неверный формат года!');
    exit;
  end;

  D_MONTH := '';
  D_MONTH := InputBox('ОТЧЕТ', 'Введите месяц; формат: 01, 3, 12, 08...', '');
  if ((D_MONTH = '') or (strtoint(D_MONTH) > 12) or (length(D_MONTH) > 2)) then
  begin
    showmessage('Неверный формат месяца!');
    exit;
  end;

  if length(D_MONTH) = 1 then
    D_MONTH := '0' + D_MONTH;
  *)

  // 'SELECT DECODE(a.COMPLETE, 0, 0, 
  SQL := 'SELECT DECODE(a.COMPLETE, 0, 100, (CASE WHEN a.USH_PERCENT > 100 THEN 100 ELSE a.USH_PERCENT END)) as USH_PERCENT, a.* FROM (SELECT z.zak, '
  + 'decode(c.type_dep_type_dep_id, 2, c.nomer, decode(ct.type_dep_type_dep_id, 2, ct.nomer, c.nomer)) as nomer, afull.full, afull.to_omto, afull.omto, '
  + 'decode(afull.to_omto, 0, 0, round(decode(afull.omto, 0, 0, ((afull.omto / afull.to_omto) * 100)), 0)) as OMTO_percent, '
  + '(afull.OMTO - afull.IN_USH) as uncomplete, (afull.IN_USH - afull.in_month) as complete, afull.IN_MONTH, afull.USH, '
  + 'decode(afull.in_ush, 0, 0, round(decode(afull.ush, 0, 0, ((afull.ush / (afull.in_ush - afull.in_month)) * 100)), 0)) as USH_percent, afull.USH_BAD, afull.USH_GOOD from '
  + '(SELECT ttn.DEP_DEP_ID_TO as CEH, ttn.UZAK_UZAK_ID as UZAK_ID, count(ttn.TTN_ID) as full, sum(decode(ttn.user_date1, null, 0, 1)) as TO_OMTO, '
  + 'sum(decode(ttn.user_date2, null, 0, 1)) as OMTO, sum(decode(ttn.user_date4, null, 0, 1)) as IN_USH, sum(decode(ttn.date_ins, null, 0, 1)) as USH, '
  + 'sum(decode(ttn.GOOD_DATE, null, 0, (CASE WHEN ttn.date_ins > ttn.GOOD_DATE THEN 1 ELSE 0 END))) as USH_BAD, '
  + 'sum(decode(ttn.GOOD_DATE, null, decode(ttn.date_ins, null, 0, 1), (CASE WHEN ttn.date_ins <= ttn.GOOD_DATE THEN 1 ELSE 0 END))) as USH_GOOD, '
  + 'sum (  CASE WHEN (ttn.date_ins is null) THEN CASE WHEN (ttn.user_date4 is null) THEN 0 ELSE (CASE WHEN (TO_NUMBER(TO_CHAR(ttn.user_date4, ' + DD_MASK + ')) > '
  + '(TO_NUMBER(to_char(last_day(ttn.user_date2),' + DD_MASK + ')) - 3)) THEN 1 ELSE 0 END) END ELSE 0 END) as IN_MONTH from '
  + '(SELECT (CASE WHEN (mod(to_char(ttn.user_date4, ' + char(39) + 'J' + char(39) + '), 7) + 1) in (3, 4, 5) THEN ttn.user_date4 + interval ' + char(39) + '5'
  + char(39) + ' day ELSE ttn.user_date4 + interval ' + char(39) + '3' + char(39) + ' day END ) as GOOD_DATE, ttn.* FROM TRONIX.TTN ttn) ttn WHERE '
  + '<MAIN_NOMEN> and ttn.type_ttn_type_ttn_id in (' + TYPE_TTN_ARRAY + ') and <DATE_INDEX> '
  + '(TO_CHAR(ttn.user_date4, ' + MM_MASK + ') = TO_CHAR((to_date(<MONTH_YEAR>, ' + DM_MASK + ') - interval ' + char(39) + '1' + char(39) + ' month), ' + MM_MASK + ') AND '
  + '(ttn.user_date4 > (last_day(to_date(<MONTH_YEAR>, ' + DM_MASK + ') - interval ' + char(39) + '1' + char(39) + ' month) - interval ' + char(39) + '3' + char(39) + ' day) ) AND '
  + '(ttn.date_ins is null or TO_CHAR(ttn.date_ins, ' + MM_MASK + ') = <MONTH_NUM>))) group by ttn.DEP_DEP_ID_TO, ttn.UZAK_UZAK_ID) afull, kadry_dep c, kadry_dep ct, '
  + 'tronix.zakaz z where afull.ceh = c.dep_id(+) and c.dep_dep_id = ct.dep_id(+) and afull.uzak_id = z.nn(+)) a order by A.nomer, A.zak, A.full';
  
  // 'SELECT DECODE(a.COMPLETE, 0, 100,
  if main_nomen then
  SQL := 'SELECT DECODE(a.COMPLETE, 0, 0, (CASE WHEN a.USH_PERCENT > 100 THEN 100 ELSE a.USH_PERCENT END)) as USH_PERCENT, a.* FROM (SELECT z.zak, '
  + 'decode(c.type_dep_type_dep_id, 2, c.nomer, decode(ct.type_dep_type_dep_id, 2, ct.nomer, c.nomer)) as nomer, afull.full, afull.to_omto, afull.omto, '
  + 'decode(afull.to_omto, 0, 0, round(decode(afull.omto, 0, 0, ((afull.omto / afull.to_omto) * 100)), 0)) as OMTO_percent, '
  + '(afull.OMTO - afull.IN_USH) as uncomplete, (afull.IN_USH - afull.in_month) as complete, afull.IN_MONTH, afull.USH, '
  + 'decode(afull.in_ush, 0, 0, round(decode(afull.ush, 0, 0, ((afull.ush / (afull.in_ush - afull.in_month)) * 100)), 0)) as USH_percent, afull.USH_BAD, afull.USH_GOOD from '
  + '(SELECT ttn.DEP_DEP_ID_TO as CEH, ttn.UZAK_UZAK_ID as UZAK_ID, count(ttn.TTN_ID) as full, sum(decode(ttn.user_date1, null, 0, 1)) as TO_OMTO, '
  + 'sum(decode(ttn.user_date2, null, 0, 1)) as OMTO, sum(decode(ttn.user_date4, null, 0, 1)) as IN_USH, sum(decode(ttn.date_ins, null, 0, 1)) as USH, '
  + 'sum(decode(ttn.GOOD_DATE, null, 0, (CASE WHEN ttn.date_ins > ttn.GOOD_DATE THEN 1 ELSE 0 END))) as USH_BAD, '
  + 'sum(decode(ttn.GOOD_DATE, null, decode(ttn.date_ins, null, 0, 1), (CASE WHEN ttn.date_ins <= ttn.GOOD_DATE THEN 1 ELSE 0 END))) as USH_GOOD, '
  + 'sum (  CASE WHEN (ttn.date_ins is null) THEN CASE WHEN (ttn.user_date4 is null) THEN 0 ELSE (CASE WHEN (TO_NUMBER(TO_CHAR(ttn.user_date4, ' + DD_MASK + ')) > '
  + '(TO_NUMBER(to_char(last_day(ttn.user_date2),' + DD_MASK + ')) - 3)) THEN 1 ELSE 0 END) END ELSE 0 END) as IN_MONTH from '
  + '(SELECT (CASE WHEN (mod(to_char(ttn.user_date4, ' + char(39) + 'J' + char(39) + '), 7) + 1) in (3, 4, 5) THEN ttn.user_date4 + interval ' + char(39) + '5'
  + char(39) + ' day ELSE ttn.user_date4 + interval ' + char(39) + '3' + char(39) + ' day END ) as GOOD_DATE, ttn.* FROM TRONIX.TTN ttn) ttn WHERE '
  + '<MAIN_NOMEN> and ttn.type_ttn_type_ttn_id in (' + TYPE_TTN_ARRAY + ') '
  + 'group by ttn.DEP_DEP_ID_TO, ttn.UZAK_UZAK_ID) afull, kadry_dep c, kadry_dep ct, '
  + 'tronix.zakaz z where afull.ceh = c.dep_id(+) and c.dep_dep_id = ct.dep_id(+) and afull.uzak_id = z.nn(+)) a order by A.nomer, A.zak, A.full';

  //нужна дополнительная группировка в коде (есть дубликаты) ???? (ВОЗМОЖНО ИЗ-ЗА ПРИВЯЗОК К НЕ ЦЕХОВЫМ ПОДРАЗДЕЛЕНИЯМИ ОДНОГО РОДИТЕЛЯ)
  //прогнать user_date4 = null для user_date2 is null, для 5 и 44 типов где user_date4 is not null
  //просуммировать все значения с группировкой по ЦЕХ и ЗАКАЗ
  //в обычном отчете по user_date2 появляются не 100% скорее всего из-за user_date2 is null and user_date4 is not null)
  //переписать запрос!!!

  SQL := StringReplace(SQL, '<MONTH_NUM>', char(39) + date_filter_month + char(39), [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<MONTH_YEAR>', char(39) + date_filter_month + '.' + date_filter_year + char(39), [rfReplaceAll, rfIgnoreCase]);

  if main_nomen then
  begin
    (*
    SQL := StringReplace(SQL, '<MAIN_NOMEN>', 'ttn.ttn_id in (select src.TTN_ID from TRONIX.DEFICIT_MAIN_NOMEN src WHERE src.CHK_FLD = '
    + char(39) + '1' + char(39) + ' GROUP BY src.TTN_ID)', [rfReplaceAll, rfIgnoreCase]);
    *)

     SQL := StringReplace(SQL, '<MAIN_NOMEN>', 'ttn.ttn_id in (select tn.ttn_id from tronix.ttn tn, tronix.ttn_mat tnmat, tronix.main_nomenclature main '
     + 'where TO_CHAR(main.date_ins, ' + char(39) + 'MM.YYYY' + char(39) + ') = ' + char(39) +  date_filter_month + '.' + date_filter_year + char(39) + ' '
     + 'and tn.type_ttn_type_ttn_id in (5, 44) and tn.ttn_id = tnmat.ttn_ttn_id and tnmat.sprav_sprav_id = main.sprav_id and tn.uzak_uzak_id = main.uzak_id '
     + 'and tn.dep_dep_id_to = main.dep_id group by tn.ttn_id)',
      [rfReplaceAll, rfIgnoreCase]);

    //SQL := StringReplace(SQL, '<DATE_INDEX>', '1', [rfReplaceAll, rfIgnoreCase]);
    //SQL := StringReplace(SQL, '<DATE_INDEX>', '(1 = 1)', [rfReplaceAll, rfIgnoreCase]);
  end
  else
  begin
    SQL := StringReplace(SQL, '<MAIN_NOMEN>', '(1 = 1)', [rfReplaceAll, rfIgnoreCase]);
    //SQL := StringReplace(SQL, '<DATE_INDEX>', '2', [rfReplaceAll, rfIgnoreCase]);
    SQL := StringReplace(SQL, '<DATE_INDEX>', '(to_char(ttn.user_date2, ' + DM_MASK + ') = ' + char(39) + date_filter_month + '.' + date_filter_year
    + char(39) + ' or', [rfReplaceAll, rfIgnoreCase]);   //07.02.2020: "01 changed  to 01.2020"
  end;

  //showmessage(SQL);
  //exit;
  //clipboard.AsText := SQL;

  DBSession_construct();

  form1.execQuery(OracleQuery_1, SQL, false);
  if OracleQuery_1.RecordCount < 1 then
  begin
    DBSession_construct();
    exit;
  end
  else
    OracleQuery_1.First;

  FExcel := CreateOleObject('Excel.Application');
  FExcel.EnableEvents := False;
  FExcel.Visible := false;

  FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_TTRTTNS.xlsx');
  FExcel.Workbooks[1].WorkSheets[1].Name := 'Отчет по требованиям';
  Sheet:=FExcel.Workbooks[1].WorkSheets['Отчет по требованиям'];

  Sheet.Cells[1, 1].Value := 'Отчет за ' + date_filter_month + '.' + date_filter_year;
  if main_nomen then
    Sheet.Cells[1, 1].Value := Sheet.Cells[1, 1].Text + ' (Основная номенклатура)';

  startNum := 3;
  strNum := startNum;

  //showmessage(inttostr(OracleQuery_1.RecordCount));

  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 13]].Font.Size := 14;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 13]].borders.linestyle := xlContinuous;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 13]].HorizontalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 13]].VerticalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 13]].WrapText := true;

  while not OracleQuery_1.Eof do
  begin
    //CEH
    Sheet.Cells[strNum, 1].Value := OracleQuery_1.FieldByName('NOMER').asString;
    //Zakaz
    Sheet.Cells[strNum, 2].NumberFormat := '@';
    Sheet.Cells[strNum, 2].Value := OracleQuery_1.FieldByName('ZAK').asString;
    //Vsego documentov
    Sheet.Cells[strNum, 3].Value := OracleQuery_1.FieldByName('FULL').asString;
    //Otpravleno v snabjenie
    Sheet.Cells[strNum, 4].Value := OracleQuery_1.FieldByName('TO_OMTO').asString;
    //Vypolneno snabjeniem
    Sheet.Cells[strNum, 5].Value := OracleQuery_1.FieldByName('OMTO').asString;
    //v procentah  /\
    Sheet.Cells[strNum, 6].Value := OracleQuery_1.FieldByName('OMTO_PERCENT').asString;
    //Trebovaniya bez bumagi
    Sheet.Cells[strNum, 7].Value := OracleQuery_1.FieldByName('UNCOMPLETE').asString;
    //Trebovaniya s bumajnim variantom
    Sheet.Cells[strNum, 8].Value := OracleQuery_1.FieldByName('COMPLETE').asString;
    //za 3 dnya do konca mesyaca
    Sheet.Cells[strNum, 9].Value := OracleQuery_1.FieldByName('IN_MONTH').asString;
    //v strok
    Sheet.Cells[strNum, 10].Value := OracleQuery_1.FieldByName('USH_GOOD').asString;
    //ne v srok
    Sheet.Cells[strNum, 11].Value := OracleQuery_1.FieldByName('USH_BAD').asString;
    //Vypolneno USH (zakryto)
    Sheet.Cells[strNum, 12].Value := OracleQuery_1.FieldByName('USH').asString;
    //v procentah /\
    Sheet.Cells[strNum, 13].Value := OracleQuery_1.FieldByName('USH_PERCENT').asString;

    inc(strNum);
    OracleQuery_1.Next;
  end;

  inc(strNum);
  
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum, 13]].Font.Size := 16;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 13]].borders.linestyle := xlContinuous;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 13]].HorizontalAlignment := xlCenter;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 13]].VerticalAlignment := xlCenter;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 2]].MergeCells := true;
  
  Sheet.Cells[strNum, 1].Font.Bold := True;
  Sheet.Cells[strNum, 1].Font.Size := 16;
  Sheet.Cells[strNum, 1].NumberFormat := '@';
  Sheet.Cells[strNum, 1].Value := 'ИТОГО: ';
  Sheet.Cells[strNum, 1].HorizontalAlignment := xlRight;
  Sheet.Cells[strNum, 1].VerticalAlignment := xlCenter;

  Sheet.Cells[strNum, 3].NumberFormat := '';

  Sheet.Cells[strNum, 4].NumberFormat := '';
  Sheet.Cells[strNum, 4].Formula := '=SUM(D' + inttostr(startNum) + ':D' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 5].NumberFormat := '';
  Sheet.Cells[strNum, 5].Formula := '=SUM(E' + inttostr(startNum) + ':E' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 6].Formula := '=((E' + inttostr(strNum) + '/D' + inttostr((strNum)) + ') * 100)';

  Sheet.Cells[strNum, 7].NumberFormat := '';
  Sheet.Cells[strNum, 7].Formula := '=SUM(G' + inttostr(startNum) + ':G' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 8].NumberFormat := '';
  Sheet.Cells[strNum, 8].Formula := '=SUM(H' + inttostr(startNum) + ':H' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 9].NumberFormat := '';
  Sheet.Cells[strNum, 9].Formula := '=SUM(I' + inttostr(startNum) + ':I' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 10].NumberFormat := '';
  Sheet.Cells[strNum, 10].Formula := '=SUM(J' + inttostr(startNum) + ':J' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 11].NumberFormat := '';
  Sheet.Cells[strNum, 11].Formula := '=SUM(K' + inttostr(startNum) + ':K' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 12].NumberFormat := '';
  Sheet.Cells[strNum, 12].Formula := '=SUM(L' + inttostr(startNum) + ':L' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 13].NumberFormat := '';
  //Sheet.Cells[strNum, 11].Formula := '=IF(((J' + inttostr(strNum) + '/H' + inttostr((strNum)) + ') * 100) > 100, 100, K' + inttostr(strNum) + ')';
  Sheet.Cells[strNum, 13].Formula := '=IF(((L' + inttostr(strNum) + '/H' + inttostr((strNum)) + ') * 100) > 100, 100, ((L' + inttostr(strNum) + '/H' + inttostr((strNum)) + ') * 100))';

  FExcel.Visible := true;
  FExcel := Unassigned;

  DBSession_destruct();
end;

procedure main_nomenclature_list(t : string; s : string; c : string);
var
  SQL : string;
  FExcel, Sheet : OleVariant;
  startNum, strNum : integer;  
const
  MMYYYY_MASK = 'mm.YYYY';
begin                    

  SQL :=                 
  'select zk.zak, dp.nomer, B.* from (select round((a.main_kol - (a.zapas - a.main_zapas)), 5) as left, round((a.main_kol_uchet - (a.zapas_uchet - a.main_zapas_uchet)), 5) '
  + 'as left_uchet, A.* from (select decode(main.need_kol, null, 0, 1) as flag, round(decode(main.need_kol, null, 0, (main.need_kol * '
  + 'tronix_kof_koded(sp.sprav_id, main.koded_id, defa.koded_potr))), 5) as main_kol, round(decode(main.need_kol, null, 0, (main.need_kol * tronix_kof_koded(sp.sprav_id, main.koded_id, defa.koded_uchet))), 5) as '
  + 'main_kol_uchet, round(decode(main.need_kol, null, 0, (main.zapas_kol * tronix_kof_koded(sp.sprav_id, main.koded_id, defa.koded_potr))), 5) as main_zapas, '
  + 'round(decode(main.need_kol, null, 0, (main.zapas_kol * tronix_kof_koded(sp.sprav_id, main.koded_id, defa.koded_uchet))), 5) as main_zapas_uchet, '
  + 'defa.s_i as sprav_id, sp.kod, substr(upper(ltrim(tronix_sp_sp_name(defa.s_i, null, 3))), 1, 200) as MTR_NAME, round(defa.potr, 5) as potr, '
  + 'fkd.namek as ed_izm, defa.koded_potr as koded, round(defa.potr_uchet, 5) as potr_uchet, skd.namek as uch_ed_izm, defa.koded_uchet as koded_uchet, '
  + 'round(defa.zapas, 5) as zapas, round(defa.zapas_uchet, 5) as zapas_uchet, defa.d as deficit, defa.d_u as deficit_uchet, defa.uzak_id, defa.dep_id from '
  + '(select A.*, round((A.potr - A.zapas), 5) as d, round((A.potr_uchet - A.zapas_uchet), 5) as d_u from (select src.dep_id, src.uzak_id, src.POTR, '
  + '(src.POTR * tronix_kof_koded(src.sprav_id, src.koded_potr, src.koded_uchet)) as potr_uchet, src.ZAPAS, (src.ZAPAS * tronix_kof_koded(src.sprav_id, '
  + 'src.koded_potr, src.koded_uchet)) as zapas_uchet, src.SPRAV_ID as s_i, src.koded_potr, src.koded_uchet from (select tt.dep_id, tt.uzak_id, '
  + 'tt.sprav_id as sprav_id, sum(tt.POTR) as potr, sum(tt.ZAPAS_TR) as zapas, tt.koded_potr as koded_potr, tt.koded_uchet as koded_uchet from '
  + '(select tx.sprav_sprav_id as sprav_id, nvl(tx.KOL, 0) as POTR, nvl(tx.ZAPAS_POST_TR, 0) as ZAPAS_TR, tx.KODED_KODED_ID as koded_potr, '
  + 'nvl(sp.koded_koded_id2, sp.koded_koded_id) as koded_uchet, tx.dep_dep_id as dep_id, tx.uzak_uzak_id as uzak_id from tx_car_potr tx, tronix_sprav sp, '
  + '(select m.sprav_id, m.uzak_id, m.dep_id from tronix.main_nomenclature m where TO_CHAR(m.date_ins, ' + char(39) + MMYYYY_MASK + char(39) + ') = '
  + char(39) + t + '.' + s + char(39) + ') main where '
  + 'tx.sprav_sprav_id = sp.sprav_id(+) and main.sprav_id = tx.sprav_sprav_id(+) and main.uzak_id = tx.uzak_uzak_id(+) and main.dep_id = tx.dep_dep_id(+)) '
  + 'tt group by tt.sprav_id, tt.koded_potr, tt.koded_uchet, tt.dep_id, '
  + 'tt.uzak_id) src ) A ) defa, tronix_sprav sp, tronix.koded fkd, tronix.koded skd, (select TO_CHAR(m.date_ins, ' + char(39) + MMYYYY_MASK
  + char(39) + ') as date_i, m.* from tronix.main_nomenclature m) main where '
  + '(defa.d > 0 or defa.d_u > 0) and defa.koded_potr = fkd.koded_id(+) and defa.koded_uchet = skd.koded_id(+) and defa.s_i = sp.sprav_id(+) and '
  + 'defa.s_i = main.sprav_id(+) and defa.dep_id = main.dep_id(+) and defa.uzak_id = main.uzak_id(+) and ' + char(39) + t + '.' + s + char(39) + ' '
  + '= main.date_i(+) order by TO_NUMBER(sp.kod) desc) A where A.flag = 1) B, tronix.zakaz zk, kadry_dep dp '
  + 'where (B.left > 0 or B.left_uchet > 0) and B.uzak_id = zk.nn(+) and B.dep_id = dp.dep_id(+) <CEH_FILTER> order by dp.nomer, zk.zak, b.kod';
  
  if (*Assigned(c)*) C <> '' then
    SQL := StringReplace(SQL, '<CEH_FILTER>', 'and dp.nomer = ' + char(39) + c + char(39), [rfReplaceAll, rfIgnoreCase])
  else
    SQL := StringReplace(SQL, '<CEH_FILTER>', 'and (1 = 1)', [rfReplaceAll, rfIgnoreCase]);

  //Clipboard.asText := SQL;
  //exit;
  //showmessage(SQL);

  DBSession_construct();
  
  form1.execQuery(OracleQuery_1, SQL, false);
  if OracleQuery_1.RecordCount < 1 then
  begin
    DBSession_construct();
    exit;
  end
  else
    OracleQuery_1.First;
    
  FExcel := CreateOleObject('Excel.Application');
  FExcel.EnableEvents := False;
  FExcel.Visible := false;

  FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_MAIN_NOMENCLATURE.xlsx');
  FExcel.Workbooks[1].WorkSheets[1].Name := 'Список основной номенклатуры';
  Sheet := FExcel.Workbooks[1].WorkSheets['Список основной номенклатуры'];

  Sheet.Cells[1, 1].Value := 'Основная номенклатура на ' + t + '.' + s + #10#13 + 'Составлено: ' + DateToStr(now);

  startNum := 4;
  strNum := startNum;

  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 16]].Font.Size := 14;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 16]].borders.linestyle := xlContinuous;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 16]].HorizontalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 16]].VerticalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 16]].WrapText := true;

  while not OracleQuery_1.Eof do
  begin
    Sheet.Cells[strNum, 1].NumberFormat := '@';
    Sheet.Cells[strNum, 1].Value := OracleQuery_1.FieldByName('ZAK').asString;

    Sheet.Cells[strNum, 2].NumberFormat := '@';
    Sheet.Cells[strNum, 2].Value := OracleQuery_1.FieldByName('NOMER').asString;

    Sheet.Cells[strNum, 3].NumberFormat := '@';
    Sheet.Cells[strNum, 3].Value := OracleQuery_1.FieldByName('KOD').asString;

    Sheet.Cells[strNum, 4].NumberFormat := '@';
    Sheet.Cells[strNum, 4].Value := OracleQuery_1.FieldByName('MTR_NAME').asString;

    Sheet.Cells[strNum, 5].Value := Form9.excelFloat(OracleQuery_1.FieldByName('POTR').asString);
    Sheet.Cells[strNum, 6].Value := OracleQuery_1.FieldByName('ed_izm').asString;
    Sheet.Cells[strNum, 7].Value := Form9.excelFloat(OracleQuery_1.FieldByName('POTR_UCHET').asString);
    Sheet.Cells[strNum, 8].Value := OracleQuery_1.FieldByName('uch_ed_izm').asString;

    Sheet.Cells[strNum, 9].Value := Form9.excelFloat(OracleQuery_1.FieldByName('ZAPAS').asString);
    Sheet.Cells[strNum, 10].Value := Form9.excelFloat(OracleQuery_1.FieldByName('ZAPAS_UCHET').asString);

    Sheet.Cells[strNum, 11].Value := Form9.excelFloat(OracleQuery_1.FieldByName('DEFICIT').asString);
    Sheet.Cells[strNum, 12].Value := Form9.excelFloat(OracleQuery_1.FieldByName('DEFICIT_UCHET').asString);

    Sheet.Cells[strNum, 13].Value := Form9.excelFloat(OracleQuery_1.FieldByName('MAIN_KOL').asString);
    Sheet.Cells[strNum, 14].Value := Form9.excelFloat(OracleQuery_1.FieldByName('MAIN_KOL_UCHET').asString);

    Sheet.Cells[strNum, 15].Value := Form9.excelFloat(OracleQuery_1.FieldByName('LEFT').asString);
    Sheet.Cells[strNum, 16].Value := Form9.excelFloat(OracleQuery_1.FieldByName('LEFT_UCHET').asString);
    
    inc(strNum);
    OracleQuery_1.Next;
  end;

  //mtr_name
  Sheet.Range[Sheet.Cells[startNum, 4], Sheet.Cells[startNum + (OracleQuery_1.RecordCount - 1), 4]].HorizontalAlignment := xlLeft;
  Sheet.Range[Sheet.Cells[startNum, 4], Sheet.Cells[startNum + (OracleQuery_1.RecordCount - 1), 4]].VerticalAlignment := xlTop;
  Sheet.Range[Sheet.Cells[startNum, 4], Sheet.Cells[startNum + (OracleQuery_1.RecordCount - 1), 4]].Font.Size := 11;

  FExcel.Visible := true;
  FExcel := Unassigned;

  DBSession_destruct();
end;

procedure Show_Deficit_MainNomen;
var
SQL : string;
FExcel, Sheet : OleVariant;
startNum, strNum : integer;
begin

  SQL := 'select s.kod, substr( upper(ltrim(tronix_sp_sp_name(m.sprav_id, null, 3))), 1, 200 ) as mtr_name, t.nomer, tm.kol, tm.kol_uchet, d.nomer as ceh, '
  + 'z.zak from (select def.sprav_id, main.ttn_id, main.ceh_id, main.uzak_id from (select defa.s_i as sprav_id from (select src.SPRAV_ID as s_i, '
  + '(src.POTR - src.ZAPAS) as d, ((src.POTR * tronix_kof_koded(src.sprav_id, src.koded_potr, src.koded_uchet)) - '
  + '(src.ZAPAS * tronix_kof_koded(src.sprav_id, src.koded_potr, src.koded_uchet))) as d_u from (select tt.sprav_id as sprav_id, sum(tt.POTR) as potr, '
  + 'sum(tt.ZAPAS_TR) as zapas, tt.koded_potr as koded_potr, tt.koded_uchet as koded_uchet from (select (CASE WHEN (nvl(tx.ZAPAS_POST_TR, 0) = 0) THEN '
  + 'tx.sprav_sprav_id ELSE decode(tx.sprav_sprav_id_zam_snab, null, tx.sprav_sprav_id, tx.sprav_sprav_id_zam_snab) END) as sprav_id, nvl(tx.KOL, 0) as POTR, '
  + 'nvl(tx.ZAPAS_POST_TR, 0) as ZAPAS_TR, tx.KODED_KODED_ID as koded_potr, nvl(sp.koded_koded_id2, sp.koded_koded_id) as koded_uchet from tx_car_potr tx, '
  + 'tronix_sprav sp where tx.sprav_sprav_id = sp.sprav_id(+)) tt group by tt.sprav_id, tt.koded_potr, tt.koded_uchet) src ) defa where '
  + '(defa.d > 0 or defa.d_u > 0)) def, (select kod_id, vyd_id, ttn_id, ceh_id, uzak_id from tronix.deficit_main_nomen group by kod_id, vyd_id, ttn_id, '
  + 'ceh_id, uzak_id) main where main.vyd_id = def.sprav_id) m, tronix.zakaz z, kadry_dep d, tronix_sprav s, tronix.ttn t, '
  + '(select decode(sprav_sprav_id_zam_snab, null, sprav_sprav_id, sprav_sprav_id_zam_snab) as sprav_id, ttn_ttn_id as ttn_id, kol, kol_uchet from '
  + 'tronix.ttn_mat) tm where t.date_ins is null and m.sprav_id = s.sprav_id(+) and m.ttn_id = t.ttn_id(+) and m.ceh_id = d.dep_id(+) and m.uzak_id = z.nn(+) and '
  + 'm.sprav_id = tm.sprav_id(+) and t.ttn_id = tm.ttn_id order by s.kod, z.zak, t.nomer';

  form1.execQuery(OracleQuery_1, SQL, false);
  if OracleQuery_1.RecordCount < 1 then
  begin
    DBSession_construct();
    exit;
  end
  else
    OracleQuery_1.First;
    
  FExcel := CreateOleObject('Excel.Application');
  FExcel.EnableEvents := False;
  FExcel.Visible := false;

  FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_DEFICIT_ON.xlsx');
  FExcel.Workbooks[1].WorkSheets[1].Name := 'Дефицит основной номенклатуры';
  Sheet := FExcel.Workbooks[1].WorkSheets['Дефицит основной номенклатуры'];

  startNum := 2;
  strNum := startNum;

  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 7]].Font.Size := 14;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 7]].borders.linestyle := xlContinuous;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 7]].HorizontalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 7]].VerticalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OracleQuery_1.RecordCount - 1), 7]].WrapText := true;

  while not OracleQuery_1.Eof do
  begin
    Sheet.Cells[strNum, 1].NumberFormat := '@';
    Sheet.Cells[strNum, 1].Value := OracleQuery_1.FieldByName('KOD').asString;

    Sheet.Cells[strNum, 2].Value := OracleQuery_1.FieldByName('MTR_NAME').asString;

    Sheet.Cells[strNum, 3].NumberFormat := '@';
    Sheet.Cells[strNum, 3].Value := OracleQuery_1.FieldByName('NOMER').asString;

    Sheet.Cells[strNum, 4].Value := form9.excelFloat(OracleQuery_1.FieldByName('KOL').asString);

    Sheet.Cells[strNum, 5].Value := form9.excelFloat(OracleQuery_1.FieldByName('KOL_UCHET').asString);

    Sheet.Cells[strNum, 6].NumberFormat := '@';
    Sheet.Cells[strNum, 6].Value := OracleQuery_1.FieldByName('CEH').asString;

    Sheet.Cells[strNum, 7].NumberFormat := '@';
    Sheet.Cells[strNum, 7].Value := OracleQuery_1.FieldByName('ZAK').asString;
    
    inc(strNum);
    OracleQuery_1.Next;
  end;

  Sheet.Range[Sheet.Cells[startNum, 2], Sheet.Cells[startNum + (OracleQuery_1.RecordCount - 1), 2]].HorizontalAlignment := xlLeft;
  Sheet.Range[Sheet.Cells[startNum, 2], Sheet.Cells[startNum + (OracleQuery_1.RecordCount - 1), 2]].VerticalAlignment := xlTop;
  Sheet.Range[Sheet.Cells[startNum, 2], Sheet.Cells[startNum + (OracleQuery_1.RecordCount - 1), 2]].Font.Size := 11;

  OracleQuery_1.Close;
  FExcel.Visible := true;

  FExcel := Unassigned;
end;

function custom_ReplaceStr(source, p, r : string) : string;
var
i : integer;
begin
  i := 1;
  while (i <= length(source)) do
  begin
    if (copy(source, i, length(p)) = p) then
    begin
      delete(source, i, length(p));
      insert(r, source, i);
    end;

    inc(i);
  end;

  custom_ReplaceStr := source;
end;

(*
procedure TForm9.Show_MainNomenDetails;
var
SQL : string;
FExcel, Sheet : OleVariant;
startNum, strNum : integer;
begin

  SQL := 'SELECT (CASE WHEN a.USH_PERCENT > 100 THEN 100 ELSE a.USH_PERCENT END) as USH_PERCENT, a.* FROM (SELECT z.zak, '
  + 'decode(c.type_dep_type_dep_id, 2, c.nomer, decode(ct.type_dep_type_dep_id, 2, ct.nomer, c.nomer)) as nomer, afull.full, afull.to_omto, afull.omto, '
  + 'decode(afull.to_omto, 0, 0, round(decode(afull.omto, 0, 0, ((afull.omto / afull.to_omto) * 100)), 0)) as OMTO_percent, '
  + '(afull.OMTO - afull.IN_USH) as uncomplete, afull.IN_USH as complete, afull.USH, '
  + 'decode(afull.in_ush, 0, 0, round(decode(afull.ush, 0, 0, ((afull.ush / afull.in_ush) * 100)), 0)) as USH_percent from '
  + '(SELECT ttn.DEP_DEP_ID_TO as CEH, ttn.UZAK_UZAK_ID as UZAK_ID, count(mn.TTN_ID) as full, sum(decode(ttn.user_date1, null, 0, 1)) as TO_OMTO, '
  + 'sum(decode(ttn.user_date2, null, 0, 1)) as OMTO, sum(decode(ttn.user_date4, null, 0, 1)) as IN_USH, sum(decode(ttn.date_ins, null, 0, 1)) as USH '
  + 'from (select src.TTN_ID from TRONIX.DEFICIT_MAIN_NOMEN src WHERE src.CHK_FLD = ' + char(39) + '1' + char(39) + ' GROUP BY src.TTN_ID) mn, TRONIX.TTN ttn WHERE '
  + 'mn.TTN_ID = ttn.TTN_ID(+) and ttn.TTN_ID is not null and to_char(ttn.user_date2, ' + char(39) + 'mm' + char(39) + ') = ' + char(39) + '09' + char(39) + ' '
  + 'group by ttn.DEP_DEP_ID_TO, ttn.UZAK_UZAK_ID) afull, kadry_dep c, kadry_dep ct, tronix.zakaz z where '
  + 'afull.ceh = c.dep_id(+) and c.dep_dep_id = ct.dep_id(+) and afull.uzak_id = z.nn(+)) a order by A.nomer, A.zak, A.full';

  //showmessage(SQL);
  form1.execQuery(OraQuery3, SQL, false);
  if OraQuery3.RecordCount < 1 then
    exit
  else
    OraQuery3.First;

  FExcel := CreateOleObject('Excel.Application');
  FExcel.EnableEvents := False;
  FExcel.Visible := false;

  FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_MAINTTNS.xlsx');
  FExcel.Workbooks[1].WorkSheets[1].Name := 'Основная номенклатура';
  Sheet:=FExcel.Workbooks[1].WorkSheets['Основная номенклатура'];

  startNum := 2;
  strNum := startNum;

  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 10]].Font.Size := 14;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 10]].borders.linestyle := xlContinuous;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 10]].HorizontalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 10]].VerticalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 10]].WrapText := true;
  while not OraQuery3.Eof do
  begin
    //CEH
    Sheet.Cells[strNum, 1].Value := OraQuery3.FieldByName('NOMER').asString;
    //Zakaz
    Sheet.Cells[strNum, 2].NumberFormat := '@';
    Sheet.Cells[strNum, 2].Value := OraQuery3.FieldByName('ZAK').asString;
    //Vsego documentov
    Sheet.Cells[strNum, 3].Value := OraQuery3.FieldByName('FULL').asString;
    //Otpravleno v snabjenie
    Sheet.Cells[strNum, 4].Value := OraQuery3.FieldByName('TO_OMTO').asString;
    //Vypolneno snabjeniem
    Sheet.Cells[strNum, 5].Value := OraQuery3.FieldByName('OMTO').asString;
    //v procentah  /\
    Sheet.Cells[strNum, 6].Value := OraQuery3.FieldByName('OMTO_PERCENT').asString;
    //Trebovaniya bez bumagi
    Sheet.Cells[strNum, 7].Value := OraQuery3.FieldByName('UNCOMPLETE').asString;
    //Trebovaniya s bumajnim variantom
    Sheet.Cells[strNum, 8].Value := OraQuery3.FieldByName('COMPLETE').asString;
    //Vypolneno USH (zakryto)
    Sheet.Cells[strNum, 9].Value := OraQuery3.FieldByName('USH').asString;
    //v procentah /\
    Sheet.Cells[strNum, 10].Value := OraQuery3.FieldByName('USH_PERCENT').asString;

    inc(strNum);
    OraQuery3.Next;
  end;

  inc(strNum);

  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum, 10]].Font.Size := 16;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 10]].borders.linestyle := xlContinuous;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 10]].HorizontalAlignment := xlCenter;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 10]].VerticalAlignment := xlCenter;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 2]].MergeCells := true;
  
  Sheet.Cells[strNum, 1].Font.Bold := True;
  Sheet.Cells[strNum, 1].Font.Size := 16;
  Sheet.Cells[strNum, 1].NumberFormat := '@';
  Sheet.Cells[strNum, 1].Value := 'ИТОГО: ';
  Sheet.Cells[strNum, 1].HorizontalAlignment := xlRight;
  Sheet.Cells[strNum, 1].VerticalAlignment := xlCenter;
  
  Sheet.Cells[strNum, 3].NumberFormat := '';
  Sheet.Cells[strNum, 3].Formula := '=SUM(C' + inttostr(startNum) + ':C' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 4].NumberFormat := '';
  Sheet.Cells[strNum, 4].Formula := '=SUM(D' + inttostr(startNum) + ':D' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 5].NumberFormat := '';
  Sheet.Cells[strNum, 5].Formula := '=SUM(E' + inttostr(startNum) + ':E' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 6].NumberFormat := '';
  Sheet.Cells[strNum, 6].Formula := '=((E' + inttostr(strNum) + '/D' + inttostr((strNum)) + ') * 100)';

  Sheet.Cells[strNum, 7].NumberFormat := '';
  Sheet.Cells[strNum, 7].Formula := '=SUM(G' + inttostr(startNum) + ':G' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 8].NumberFormat := '';         
  Sheet.Cells[strNum, 8].Formula := '=SUM(H' + inttostr(startNum) + ':H' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 9].NumberFormat := '';
  Sheet.Cells[strNum, 9].Formula := '=SUM(I' + inttostr(startNum) + ':I' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 10].NumberFormat := '';
  Sheet.Cells[strNum, 10].Formula := '=((I' + inttostr(strNum) + '/(G' + inttostr(strNum) + '+H' + inttostr((strNum)) + ')) * 100)';

  OraQuery3.Close;
  FExcel.Visible := true;
  
  FExcel := Unassigned;
end;
*)

end.
