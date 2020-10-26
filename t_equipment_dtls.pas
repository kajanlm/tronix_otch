unit t_equipment_dtls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, GridsEh, DBGridEh, DBGridEhImpExp, ComObj, ExcelXP,
  MemDS, DBAccess, Ora, StdCtrls;

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

uses Unit1;

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
startIndex, insIndex, i, mI, index, mPosSize : integer;
tempStr : string;
tempDate : TDateTime;
parseStr : TStringList;
ZAKAZ : string;
saveDialog : TSaveDialog;
needMoney : boolean;
begin

if zakArgument = '' then
begin
  showMessage('Ошибка! Неверный проект.');
  exit;
end;

if Pos('/', zakArgument) <> 0 then
  ZAKAZ := copy(zakArgument, 1, 5)
else
  ZAKAZ := zakArgument;

//showmessage(zakaz);

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

(* money *)
SExcel := CreateOleObject('Excel.Application');
SExcel.EnableEvents := False;
SExcel.Visible := false;
(* money *)

//showmessage(saveDialog.FileName);
if needMoney then
begin
  //SExcel.Workbooks.Add('C:\money.xls');
  SExcel.Workbooks.Add(saveDialog.FileName);
  SExcel.DisplayAlerts := false;
  Money := SExcel.Workbooks[1].WorkSheets[1];

  (* cfg *)
  mPosSize := 16;
  mI := 7; //start

  for index := 1 to mPosSize do
    Output.Cells[3, (index + mPosSize - 1)] := Money.Cells[(mI + index), 1].Text;

  Output.Cells[3, (index + mPosSize - 1)] := 'Всего'; //Money.Cells[mI, 1].Text;
end;
saveDialog.Free;

startIndex := 4;
insIndex := startIndex;
for i := 1 to (Sheet.Cells.SpecialCells(xlCellTypeLastCell).Row - 1) do
begin
  if (Sheet.Cells[i, 3].text = ZAKAZ) then
  begin
    Output.Cells[insIndex, 1].value := (InsIndex - startIndex  + 1);

    Output.Cells[insIndex, 2].value := Sheet.Cells[i, 3].text + '/' + inttostr(InsIndex - startIndex + 1);
    
    OraQuery.Close;
    OraQuery.SQL.Text := 'select texkompl_comment from tx_texkompl where project_project_id = ' + invi_prs.Items[prs.ItemIndex] + ' '
    + 'and nomer = ' + char(39) + Sheet.Cells[i, 11].text + '_1' + char(39) + ' and rownum = 1';
    OraQuery.Open;
    Output.Cells[insIndex, 3].value := OraQuery.FieldByName('texkompl_comment').asString;

    Output.Cells[insIndex, 4].value := Sheet.Cells[i, 11].text;

    Output.Cells[insIndex, 5].value := Sheet.Cells[i, 18].text;

    Output.Cells[insIndex, 6].value := Sheet.Cells[i, 14].text;
    
    Output.Cells[insIndex, 7].NumberFormat := '@';
    Output.Cells[insIndex, 7].value := Sheet.Cells[i, 12].text;
    
    Output.Cells[insIndex, 8].value := Sheet.Cells[i, 17].text;

    Output.Cells[insIndex, 9].value := Sheet.Cells[i, 16].text;

    Output.Cells[insIndex, 10].NumberFormat := '@';
    Output.Cells[insIndex, 10].value := Sheet.Cells[i, 13].text;

    //showmessage('Акт №' + Sheet.Cells[i, 20].Text + ' от ' + Sheet.Cells[i, 21].Text);
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
      //break;       

      //showmessage(Sheet.Cells[i, 21].Value + #10#13 + Sheet.Cells[i, 21].Text);
      //showmessage(DateToStr(Sheet.Cells[i, 21].Value) + #10#13 + Sheet.Cells[i, 21].NumberFormat + #10#13 + varType(Sheet.Cells[i, 21].Value));
    end;

    if needMoney then
    begin
      mI := 7; //start
      while mI < (Money.Cells.SpecialCells(xlCellTypeLastCell).Row - 1) do
      begin

        if copy(Money.Cells[mI, 1].Text, 1, length(Output.Cells[insIndex, 4].value)) = Output.Cells[insIndex, 4].value then
        begin
          index := 1;
          for index := 1 to mPosSize do
            Output.Cells[insIndex, ((mPosSize - 1) + index)] := Money.Cells[(mI + index), 2].Text;

          Output.Cells[insIndex, ((mPosSize - 1) + index)] := Money.Cells[mI, 2].Text;
          break;
        end;

        mI := mI + (mPosSize + 1); //17
      end;
    end;

    //if Sheet.Cells[i, 21].Text <> '' then
    //  showMessage(Pchar(varType(Sheet.Cells[i, 21].Value)));
    (*
    if Sheet.Cells[i, 21].Text <> '' then
      showmessage(DateToStr(Sheet.Cells[i, 21].Value) + #10#13 + Sheet.Cells[i, 21].NumberFormat + #10#13 + varType(Sheet.Cells[i, 21].Value));
    *)
    Output.Cells[insIndex, 12].value := '';
    Output.Cells[insIndex, 13].value := Sheet.Cells[i, 4].text;
    //Output.Cells[insIndex, 14].value := Sheet.Cells[i, 16].text;
    Output.Cells[insIndex, 14].value := '';
    Output.Cells[insIndex, 15].value := '';
    
    inc(insIndex);
  end;

  Output.range[Output.cells[startIndex, 1], Output.cells[(insIndex - 1), 32]].borders.linestyle := xlContinuous;
end;

//FExcel.Visible := true;
Excel.Visible := true;

FExcel.Quit;
FExcel := Unassigned;
SExcel.Quit;
SExcel := Unassigned;
Excel := Unassigned;

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
