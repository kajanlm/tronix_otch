unit t_equipment_dtls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, GridsEh, DBGridEh, DBGridEhImpExp, ComObj, ExcelXP,
  MemDS, DBAccess, Ora, StdCtrls, clipbrd, strUtils;

type
  Tequipment_details = class(TForm)
    OraQuery: TOraQuery;
    prs: TComboBox;
    Label1: TLabel;
    invi_prs: TComboBox;
    zak: TLabel;
    create: TButton;
    Label2: TLabel;
    zakaz: TComboBox;
    invi_zakaz: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure equipmentToExcel(Sender: TObject);
    procedure prsClick(Sender: TObject);
    procedure zakazClick(Sender: TObject);
  private
    { Private declarations }
    procedure Projects;
  public
    zakArgument : string;
    { Public declarations }
  end;

var
  equipment_details: Tequipment_details;

implementation

uses Unit1, t_utils;

{$R *.dfm}

procedure Tequipment_details.FormShow(Sender: TObject);
begin
  zakArgument := '';
  Projects;
end;

procedure Tequipment_details.Projects;
begin
  OraQuery.Close;

  (*
  OraQuery.SQL.Text := 'select name, project_id from tronix.project_list where name like ' + char(39) + '%настк%' + char(39) + ' '
  + 'order by name';
  *)

  (*
  OraQuery.SQL.Text := 'select name, project_id from tronix.project_list where name like ' + char(39) + '%настк%' + char(39) + ' '
  + 'or name like ' + char(39) + 'Т%' + char(39) + ' order by name';
  *)
  
  OraQuery.SQL.Text := 'select name, project_id from tronix.project_list order by name';
  OraQuery.Open;

  prs.Clear;     
  invi_prs.Clear;

  while not OraQuery.Eof do
  begin
    prs.Items.Add(OraQuery.FieldByName('name').asString);
    invi_prs.Items.Add(OraQuery.FieldByName('project_id').asString);

    OraQuery.Next;
  end;
  
  prs.ItemIndex := -1;
  invi_prs.ItemIndex := -1;
end;

procedure Tequipment_details.equipmentToExcel(Sender: TObject);
var
FExcel, Sheet, Excel, SExcel, Output, Money : OleVariant;
startIndex, insIndex, i, mI, index, mPosSize, COUNT_ACT, COUNT_MONEY : integer;
tempStr, SQL : string;
tempDate : TDateTime;
parseStr : TStringList;
ZAKAZ : string;
saveDialog : TSaveDialog;
needMoney : boolean;
const
colSize = 15;
begin

if form1.SCAlive then
  SQL := form1.ServerRequest('EQUIP_DETAILS')
else
  exit;

if zakArgument = '' then
begin
  showMessage('Ошибка! Неверный проект.');
  exit;
end;

if Pos('/', zakArgument) <> 0 then
  ZAKAZ := copy(zakArgument, 1, 5)
else
  ZAKAZ := zakArgument;

FExcel := CreateOleObject('Excel.Application');
FExcel.EnableEvents := False;
FExcel.Visible := false;

FExcel.Workbooks.Add('\\Ser1\s1sys2\Base\Tronix\TNO.dbf');
FExcel.DisplayAlerts := false;
Sheet := FExcel.Workbooks[1].WorkSheets[1];

Sheet.Rows['1'].Delete;
Sheet.UsedRange.Sort (Sheet.Range['K2'], xlAscending,
                      EmptyParam, EmptyParam,
                      EmptyParam, EmptyParam,
                      xlAscending, xlNo, EmptyParam, True, xlTopToBottom, xlSyllabary);

(* money *)
SExcel := CreateOleObject('Excel.Application');
SExcel.EnableEvents := False;
SExcel.Visible := false;
(* money *)

Excel := CreateOleObject('Excel.Application');
Excel.EnableEvents := False;
Excel.Visible := false;

Excel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_EQUIPMENT_D.xlsx');
Output := Excel.Workbooks[1].WorkSheets[1];
Output.Cells[1, 4].Value := zak.Caption;

saveDialog := TSaveDialog.Create(self);
saveDialog.Title := 'Выберите источник затрат';
saveDialog.InitialDir := 'C:\';
saveDialog.Filter := 'xls|*.xls|xlsx|*.xlsx';
saveDialog.DefaultExt := 'xls';
saveDialog.FilterIndex := 1;

needMoney := false;
if saveDialog.Execute then
  needMoney := true
else
  showMessage('Отчет будет сформирован без затрат!');

startIndex := 4;
insIndex := startIndex;

if needMoney then
begin
  //SExcel.Workbooks.Add('C:\money.xls');
  SExcel.Workbooks.Add(saveDialog.FileName);
  SExcel.DisplayAlerts := false;
  Money := SExcel.Workbooks[1].WorkSheets[1];

  (* cfg *)
  mPosSize := 0;
  mI := 1; //start
  
  index := 1;
  while true do
  begin
    if Money.Cells[(mI + index), 3].Text <> '' then
      break;
      
    Output.Cells[(startIndex - 1), (index + colSize)] := Money.Cells[(mI + index), 1].Text;

    inc(index);
    inc(mPosSize);
  end;

  Output.Cells[(startIndex - 1), (index + colSize)] := 'Всего'; //Money.Cells[mI, 1].Text;
end;
//showmessage(inttostr(mPosSize));
saveDialog.Free;

SQL := StringReplace(SQL, '<PROJECT_MASK>', ZAKAZ, [rfReplaceAll, rfIgnoreCase]);

SQL := StringReplace(SQL, '<DECODE_MASK>', 'decode(ll.zavn, ' + char(39) + '167' + char(39) + ', ' + char(39)
+ 'А40-2Б-ЯР-2' + char(39) + ', ' + char(39) + '168' + char (39) + ', ' + char(39) + 'А40-2Б-ЯР-2' + char(39) + ', ll.proekt)', [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<T_MASK>', ansitoutf8('T'), [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<SSHORT_MASK>', 'ОДНОРАЗ', [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<MULTI_LOW_MASK>', 'многоразовая', [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<SINGLE_LOW_MASK>', 'одноразовая', [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<STORE_MASK>', 'ХРАНЕНИЕ', [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<FIX_LOW_MASK>', 'ремонт', [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<FIX_UPPER_MASK>', 'РЕМОНТ', [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<TNO_MASK>', 'ТНО', [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<STORE_EQUIP_MULTI_MASK>', '%%ХРАНЕНИЕ%ОСНАСТКИ%%МНОГОРАЗОВАЯ%%', [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<STORE_EQUIP_SINGLE_MASK>', '%%ХРАНЕНИЕ%ОСНАСТКИ%%ОДНОРАЗОВАЯ%%', [rfReplaceAll, rfIgnoreCase]);

(*
SQL := custom_ReplaceStr(SQL, '<DECODE_MASK>', 'decode(ll.zavn, ' + char(39) + '167' + char(39) + ', ' + char(39)
+ 'А40-2Б-ЯР-2' + char(39) + ', ' + char(39) + '168' + char (39) + ', ' + char(39) + 'А40-2Б-ЯР-2' + char(39) + ', ll.proekt)');
SQL := custom_ReplaceStr(SQL, '<T_MASK>', 'T');
SQL := custom_ReplaceStr(SQL, '<SSHORT_MASK>', 'ОДНОРАЗ');
SQL := custom_ReplaceStr(SQL, '<MULTI_LOW_MASK>', 'многоразовая');
SQL := custom_ReplaceStr(SQL, '<SINGLE_LOW_MASK>', 'одноразовая');
SQL := custom_ReplaceStr(SQL, '<STORE_MASK>', 'ХРАНЕНИЕ');
SQL := custom_ReplaceStr(SQL, '<FIX_LOW_MASK>', 'ремонт');
SQL := custom_ReplaceStr(SQL, '<FIX_UPPER_MASK>', 'РЕМОНТ');
SQL := custom_ReplaceStr(SQL, '<TNO_MASK>', 'ТНО');
SQL := custom_ReplaceStr(SQL, '<STORE_EQUIP_MULTI_MASK>', '%%ХРАНЕНИЕ%ОСНАСТКИ%%МНОГОРАЗОВАЯ%%');
SQL := custom_ReplaceStr(SQL, '<STORE_EQUIP_SINGLE_MASK>', '%%ХРАНЕНИЕ%ОСНАСТКИ%%ОДНОРАЗОВАЯ%%');
*)
//Clipboard.asText := SQL;
//showmessage(SQL);

form1.execQuery(OraQuery, SQL, false);

//exit;

//showmessage(zakaz);

COUNT_ACT := 0;
COUNT_MONEY := 0;

while not OraQuery.Eof do
begin
  Output.Cells[insIndex, 1].value := OraQuery.FieldByName('n').asString;//(InsIndex - startIndex  + 1);  //'n'

  Output.Cells[insIndex, 2].value := ZAKAZ + '/' + inttostr(InsIndex - startIndex + 1);

  (*
  OraQuery.Close;
  OraQuery.SQL.Text := 'select texkompl_comment from tx_texkompl where project_project_id = ' + invi_prs.Items[prs.ItemIndex] + ' '
  + 'and nomer = ' + char(39) + OraQuery.FieldByName('CH').asString + '_1' + char(39) + ' and rownum = 1';
  OraQuery.Open;
  Output.Cells[insIndex, 3].value := OraQuery.FieldByName('texkompl_comment').asString;
  *)

  Output.Cells[insIndex, 3].value := OraQuery.FieldByName('TX_COMM').asString;

  Output.Cells[insIndex, 4].value := OraQuery.FieldByName('CH').asString;

  Output.Cells[insIndex, 5].value := OraQuery.FieldByName('NAME').asString;

  Output.Cells[insIndex, 6].value := OraQuery.FieldByName('KOL').asString;

  Output.Cells[insIndex, 7].NumberFormat := '@';
  Output.Cells[insIndex, 7].value := OraQuery.FieldByName('MASSA').asString;

  Output.Cells[insIndex, 8].value := OraQuery.FieldByName('DOCU').asString;

  Output.Cells[insIndex, 9].value := OraQuery.FieldByName('PRIZNAK').asString;

  Output.Cells[insIndex, 10].NumberFormat := '@';
  Output.Cells[insIndex, 10].value := OraQuery.FieldByName('TRUD').asString;

  //showmessage('Акт №' + Sheet.Cells[i, 20].Text + ' от ' + Sheet.Cells[i, 21].Text);

  //add check for date_otk is null (if null - no check)!!!
  if OraQuery.FieldByName('DATEINS').asString <> '' then
  begin

    for i := 1 to (Sheet.Cells.SpecialCells(xlCellTypeLastCell).Row - 1) do
    begin

      if ((Sheet.Cells[i, 3].text <> ZAKAZ) or (Sheet.Cells[i, 5].text <> OraQuery.FieldByName('CH').asString)) then
        continue;

      if Sheet.Cells[i, 30].Text <> '' then
      begin
        Output.Cells[insIndex, 11].value := 'Акт №' + Sheet.Cells[i, 30].Text + ' от ';
        
        //showmessage('== ' + Sheet.Cells[i, 21].Text);
        if Sheet.Cells[i, 31].NumberFormat <> 'ДД.ММ.ГГГГ' then
        begin
          tempStr := Sheet.Cells[i, 31].Text;
          Insert('.', tempStr, 5); //2020.1010
          Insert('.', tempStr, 8); //2020.10.10

          parseStr := form1.strtok(tempStr, '.');
          tempStr := parseStr[0] + '.' + parseStr[1] + '.' + parseStr[2];
          
          tempDate := StrToDate(tempStr);
        end
        else
          tempDate := Sheet.Cells[i, 31].Value;
        
        Output.Cells[insIndex, 11].value := Output.Cells[insIndex, 11].value + DateToStr(tempDate);
        inc(COUNT_ACT);
        break;

        //showmessage(Sheet.Cells[i, 21].Value + #10#13 + Sheet.Cells[i, 21].Text);
        //showmessage(DateToStr(Sheet.Cells[i, 21].Value) + #10#13 + Sheet.Cells[i, 21].NumberFormat + #10#13 + varType(Sheet.Cells[i, 21].Value));
      end;

    end;

    if needMoney then                                          
    begin
      mI := 1; //start
      while mI < (Money.Cells.SpecialCells(xlCellTypeLastCell).Row - 1) do
      begin

        if copy(Money.Cells[mI, 1].Text, 1, length(Output.Cells[insIndex, 4].value)) = Output.Cells[insIndex, 4].value then
        begin
          index := 1;
          for index := 1 to mPosSize do
            Output.Cells[insIndex, (colSize + index)] := Money.Cells[(mI + index), 2].Text;

          Output.Cells[insIndex, (colSize + index)] := Money.Cells[mI, 2].Text;
          inc(COUNT_MONEY);
          break;
        end;
        
        mI := mI + (mPosSize + 1);
      end;
    end;
    
  end;

  //if Sheet.Cells[i, 21].Text <> '' then
  //  showMessage(Pchar(varType(Sheet.Cells[i, 21].Value)));
  (*
  if Sheet.Cells[i, 21].Text <> '' then
    showmessage(DateToStr(Sheet.Cells[i, 21].Value) + #10#13 + Sheet.Cells[i, 21].NumberFormat + #10#13 + varType(Sheet.Cells[i, 21].Value));
  *)
  Output.Cells[insIndex, 12].value := '';
  Output.Cells[insIndex, 13].value := OraQuery.FieldByName('PODR').asString;
  //Output.Cells[insIndex, 14].value := Sheet.Cells[i, 16].text;
  Output.Cells[insIndex, 14].value := '';
  Output.Cells[insIndex, 15].value := '';

  inc(insIndex);
  //end;
  OraQuery.Next;

  Output.range[Output.cells[startIndex, 1], Output.cells[(insIndex - 1), (colSize + mPosSize + 1)]].borders.linestyle := xlContinuous;
end;

//FExcel.Visible := true;
Excel.Visible := true;

FExcel.Quit;
FExcel := Unassigned;
SExcel.Quit;
SExcel := Unassigned;
Excel := Unassigned;

showmessage('Обработано строк = ' + inttostr(OraQuery.RecordCount)
+ #10#13 + 'Из них:' + #10#13
+ '    актов = ' + inttostr(COUNT_ACT) + ';' + #10#13
+ '    затрат = ' + inttostr(COUNT_MONEY) + '.');

end;

procedure Tequipment_details.prsClick(Sender: TObject);
begin
  zakArgument := '';
  zak.Caption := '';

  if prs.ItemIndex = -1 then
    exit;

  zakaz.Clear;
  invi_zakaz.Clear;

  OraQuery.Close;
  OraQuery.SQL.Text := 'Select zak.zak, feb.text, zak.id_project, zak.nn from tronix.feb_name feb, tronix.zakaz zak '
  + 'where zak.name = feb.nn and zak.id_project = ' + invi_prs.Items[prs.ItemIndex] + ' order by zak.zak desc';
  OraQuery.Open;

  while not OraQuery.Eof do
  begin
    zakaz.Items.Add(OraQuery.FieldByName('zak').asString + ' ' + OraQuery.FieldByName('text').asString);
    invi_zakaz.Items.Add(OraQuery.FieldByName('zak').asString);

    OraQuery.Next;
  end;
end;

procedure Tequipment_details.zakazClick(Sender: TObject);
begin
  zakArgument := '';
  zak.Caption := '';

  zakArgument := invi_zakaz.Items[zakaz.ItemIndex];
  zak.Caption := zakaz.Items[zakaz.ItemIndex];
end;

end.
