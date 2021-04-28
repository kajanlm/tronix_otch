unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Ora, Grids, DBGridEh, StdCtrls, GridsEh,
  ExcelXP, OleServer,ComObj, CheckLst;
  
type
  TForm9 = class(TForm)
    OraQuery1: TOraQuery;
    Label1: TLabel;
    DBGridEh1: TDBGridEh;
    OraDataSource1: TOraDataSource;
    OraQuery2: TOraQuery;
    OraDataSource2: TOraDataSource;
    DBGridEh2: TDBGridEh;
    Label2: TLabel;
    Edit1: TEdit;                   
    ComboBox1: TComboBox;
    Label3: TLabel;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    OraQuery3: TOraQuery;
    Button1: TButton;
    Edit2: TEdit;
    uzaks_memory: TComboBox;
    uzaks: TCheckListBox;
    Button2: TButton;
    allzakz: TCheckBox;
    Deps: TComboBox;
    deps_label: TLabel;
    allprs: TCheckBox;
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure allprsClick(Sender: TObject);
  private
    { Private declarations }
    temp_priz:integer;
    procedure ProjectList;
  public
    { Public declarations }
	  function excelFloat(s : string) : real;
  end;

var
  Form9: TForm9;

implementation

uses t_utils, Unit10, Unit15, Unit16, Unit20, Unit21, Unit22, Unit23, Unit25, Unit26, clipbrd,
  Unit27, Unit35, Unit36, Unit37, Unit38, Unit43, Unit45, Unit46, Unit34, ftrnomen, r_ttns,
  Unit47, Unit49, Unit50, Kol_Izd_Msch_Proekt, Equipment_For_Sklad_ZIP, SP_Snab_Zakazn,No_Close_Pue_Cex_Proekt, Kol_All_Pokup_Izd_Proekt,
  PUE_Udp_Report, Udp_Norma_Fakt_Ostatok, UDP_OTK, NEZAKR_TK_PTK_UDP_ZAKR, Udp_PDO_Report, Udp_Pue_Norma_Zero, Udp_Zakazchik,Naryd_Cex_Proekt,
  Ukr_Pom_TNV_IZV,Ukr_Pom_SP_Tk,Ostatok_Trud_PUE_No_MSCH,Sum_Norm_Trud_Razr_Setka_Prof_Ukr,Norm_Trud_Prof_Razr_Setka,Ostatki_Trud_Msch,
  Equipment,Naryd_UKR_Pue,SpisokCloseOsnastki,Reserve_Msch_Cks_Place,Rasxod_proekt_years_zatr_otgr_mt,Primen_PUE_in_dok_dvig_naryd,
  Rasxod_proekt_years_zatr_otgr_ob,Rasxod_proekt_years_zatr,Rasxod_obor_otgr_prixod_order,Vedom_snab_vetka_cfek,Rasxod_mater_otgr_prixod_order,
  Unit32, Unit1, r_over_tmc, r_set_mnomen,r_calendar;

{$R *.dfm}

procedure TForm9.DBGridEh2DblClick(Sender: TObject);

const
TTN_TYPE_ARRAY = '5, 43, 44';

var
SQL,
DEP_ID,
CEH,
tSheetName : string;

FExcel,
Sheet,
Range : OleVariant;

x : integer;


begin                    
label2.Caption := OraQuery2.FieldByName('nn').AsString;
if form9.caption = 'Отчет по нарядам' then
begin
Form10.Caption := 'Отчет по нарядам';
Form10.ShowModal();
end;

if (self.Caption = 'Формирование основной номенклатуры') then
begin
  Application.CreateForm(Tf_calendar, f_calendar);
  Application.CreateForm(Tset_mnomen, set_mnomen);

  f_calendar.Showmodal();

  set_mnomen.Caption := set_mnomen.Caption + ' по проекту / заказу: ' + dbgrideh1.DataSource.DataSet.FieldByName('ZAVN').asString + ' / '
  + dbgrideh2.DataSource.DataSet.FieldByName('zak').asString;
  set_mnomen.date_f := f_calendar.result_month;
  set_mnomen.date_s := f_calendar.result_year;
  set_mnomen.Showmodal();

  set_mnomen.Free;
  f_calendar.Free;

  exit;
end;

if (self.Caption = 'Основная номенклатура по дефициту') then
begin
  (*
  if MessageDlg('Перейти к составлению основной номенклатуры или показать отчет?' + #10#13
  + 'ДА - основная номенклатура' + #10#13
  + 'НЕТ - отчет по основной номенклатуре',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Application.CreateForm(Tdefttns, defttns);
    defttns.Showmodal();
    defttns.Free;
  end
  else
    Show_MainNomenDetails;
  *)
  Application.CreateForm(Tdefttns, defttns);
  defttns.Showmodal();
  defttns.Free;
end;

if (self.Caption = 'Излишки ТМЦ') then
begin
  Application.CreateForm(Tover_tmc, over_tmc);
  over_tmc.ShowModal();
  over_tmc.free;
end;

if (self.caption = 'Дефицит по номенклатуре (старый)') then
begin
  Form15.Showmodal();
end;

if form9.caption = 'Отчет по трудоемкости (Новый)' then
begin
Form10.Caption:='Отчет по трудоемкости (Новый)';
Form10.ShowModal();
end;

 if (form9.caption = 'Выберите что сравниваем') then
begin
Form23.EDIT1.Text:= OraQuery1.FieldByName('name').AsString;
Form23.Label1.Caption:= OraQuery2.FieldByName('nn').AsString;
Form9.Close();
end;

 if (form9.caption = 'Выберите с чем сравниваем') then
begin
Form23.EDIT2.Text:= OraQuery1.FieldByName('name').AsString;
Form23.Label2.Caption:= OraQuery2.FieldByName('nn').AsString;
Form9.Close();
end;

if form9.caption = 'Отчет по материальной ведомости' then
begin
  exit;
end;

if (self.caption = 'Требования по дефициту') then
begin
  //may need multi dep

  CEH := '';
  CEH := InputBox('ПОДРАЗДЕЛЕНИЕ', 'Введите номер цеха', '');
  if CEH = '' then
  begin
    showmessage('Введите номер цеха!');
    exit;
  end;

  SQL := 'SELECT DEP_ID FROM KADRY_DEP where ROWNUM = 1 AND type_dep_type_dep_id = 2 AND nomer = '
  + char(39) + CEH + char(39);
  if not form1.execQuery(OraQuery3, SQL, false) then
    exit;

  if OraQuery3.RecordCount <> 1 then
  begin
    showmessage('Цех с номером ' + char(39) + CEH + char(39) + ' не найден!');
    exit;
  end;
  DEP_ID := OraQuery3.FieldByName('DEP_ID').asString;

  SQL := 'SELECT ZAK FROM TRONIX.ZAKAZ WHERE NN = ' + form9.Label2.Caption;
  if not form1.execQuery(OraQuery3, SQL, false) then
    exit;

  if OraQuery3.RecordCount <> 1 then
  begin
    showmessage('Ошибка проекта!');
    exit;
  end;

  if MessageDlg('Сформировать отчет по требованиями дефицита для ЗАКАЗА = ' + OraQuery3.FieldByName('ZAK').asString
  + '; ЦЕХА = ' + CEH + '???', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  tSheetName := 'deficit_' + OraQuery3.FieldByName('ZAK').asString + '_' + CEH + '_' + FormatDateTime('dd.mm.yyyy', Date);

  CEH := '(1 = 1)';
  if MessageDlg('Включить требования, которые не отправлены в снабжение (находятся в цеху)?', mtConfirmation,
  [mbYes, mbNo], 0) = mrNo then
    CEH := 'tn.USER_DATE1 is not null';

  SQL := '';
  if form1.SCAlive then
    SQL := form1.ServerRequest('TR_TTNS_FROM_DEFICIT')
  else
    exit;

  SQL := StringReplace(SQL, '<UZAK_ID>', form9.Label2.Caption, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<DEP_ID>', DEP_ID, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<TTN_TYPE>', TTN_TYPE_ARRAY, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<INIT_STATE>', CEH, [rfReplaceAll, rfIgnoreCase]);

  if not form1.execQuery(OraQuery3, SQL, false) then
    exit;

  FExcel := CreateOleObject('Excel.Application');
  FExcel.EnableEvents := False;
  FExcel.Visible := false;

  FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_TRTTNS_DEFICIT.xlsx');
  FExcel.Workbooks[1].WorkSheets[1].Name := tSheetName;

  Sheet := FExcel.Workbooks[1].WorkSheets[tSheetName];
  Range := Sheet.Columns;
  Range.NumberFormat := '@';

  x := 3; //start string-index
  Sheet.range[Sheet.cells[x, 1], Sheet.cells[(OraQuery3.RecordCount + (x - 1)), 20]].borders.linestyle := xlContinuous;
  Sheet.range[Sheet.cells[x, 1], Sheet.cells[(OraQuery3.RecordCount + (x - 1)), 20]].WrapText := true;
  Sheet.range[Sheet.cells[x, 1], Sheet.cells[(OraQuery3.RecordCount + (x - 1)), 20]].HorizontalAlignment := xlCenter;
  Sheet.range[Sheet.cells[x, 1], Sheet.cells[(OraQuery3.RecordCount + (x - 1)), 20]].VerticalAlignment := xlCenter;
  Sheet.range[Sheet.cells[x, 1], Sheet.cells[(OraQuery3.RecordCount + (x - 1)), 20]].Font.Size := 12;
  Sheet.range[Sheet.cells[x, 1], Sheet.cells[(OraQuery3.RecordCount + (x - 1)), 1]].Font.Bold := true;
  // + 2 font-size for COLUMN: KOD
  // HorizontalAlignment = xlLeft  for MTR_NAME
  //take from ttn_mat ONE "KOL" with KODED -> convert in result "KOL" to 2 koded's like a POTR

  while not OraQuery3.Eof do
  begin

    Sheet.Cells[x, 1].Value := OraQuery3.FieldByName('KOD').asString;
    Sheet.Cells[x, 2].Value := OraQuery3.FieldByName('MTR_NAME').asString;
    Sheet.Cells[x, 3].Value := OraQuery3.FieldByName('P').asString;
    Sheet.Cells[x, 4].Value := OraQuery3.FieldByName('NAMEK').asString;
    Sheet.Cells[x, 5].Value := OraQuery3.FieldByName('P_UCHET').asString;
    Sheet.Cells[x, 6].Value := OraQuery3.FieldByName('NAMEK_UCHET').asString;
    Sheet.Cells[x, 7].Value := OraQuery3.FieldByName('ZS').asString;
    Sheet.Cells[x, 8].Value := OraQuery3.FieldByName('ZS_UCHET').asString;
    Sheet.Cells[x, 9].Value := OraQuery3.FieldByName('ZC').asString;
    Sheet.Cells[x, 10].Value := OraQuery3.FieldByName('ZC_UCHET').asString;
    Sheet.Cells[x, 11].Value := OraQuery3.FieldByName('DEF').asString;
    Sheet.Cells[x, 12].Value := OraQuery3.FieldByName('DEF_UCHET').asString;
    Sheet.Cells[x, 13].Value := OraQuery3.FieldByName('NOMER').asString;
    Sheet.Cells[x, 14].Value := OraQuery3.FieldByName('KOL_UCHET').asString;   // ->swap
    Sheet.Cells[x, 15].Value := OraQuery3.FieldByName('KOL').asString;         // swap<-
    Sheet.Cells[x, 16].Value := OraQuery3.FieldByName('DATE_DOK').asString;
    Sheet.Cells[x, 17].Value := OraQuery3.FieldByName('USER_DATE1').asString;
    Sheet.Cells[x, 18].Value := OraQuery3.FieldByName('USER_DATE2').asString;
    Sheet.Cells[x, 19].Value := OraQuery3.FieldByName('USER_DATE4').asString;
    Sheet.Cells[x, 20].Value := OraQuery3.FieldByName('DATE_INS').asString;

    inc(x);
    OraQuery3.Next;
  end;

  FExcel.Visible := true;

end;

end;

procedure TForm9.ProjectList;
var FILTER_S : string;
begin
  if not allprs.Checked then
    FILTER_S := '(DATE_END is null or TO_CHAR(DATE_END) is null)'
  else
    FILTER_S := '(1 = 1)';

  OraQuery1.Close;
  OraQuery1.SQL.Text := 'Select Zavn, name, project_id,proekt from Tronix.Project_list where ' + FILTER_S + ' order by zavn';
  OraQuery1.Open;

  //DBGRidEh1.DataSource.DataSet.Refresh;
  //DBGRidEh2.DataSource.DataSet.Refresh;
end;


procedure TForm9.FormShow(Sender: TObject);
begin
 OraQuery2.Open;
  OraQuery1.Open;
  Form9.DBgridEH2.Visible:=true;
  Label3.Visible:=false;
   ComboBox1.Visible:=false;

   ProjectList;

   if ((form9.caption='Отчет по материальной ведомости') or (self.caption = 'Норма расхода материала для расчета цены по проекту (ЦФЭК)')) then
    Form9.Button1.Visible:=false;

   if self.caption = 'Норма расхода материала для расчета цены по проекту (ЦФЭК)' then
   begin
    dbgrideh2.Visible := false;
    button2.Visible := true;
   end;

if (form9.caption='Отчет по заявкам') or (form9.caption='Отчет планируемой трудоемкости') or
(form9.caption='Отчет по выполнению ведомостей (Для склада ЗИП)') or (form9.caption='Отчет по Отчет по ТН (материал изделие)')
or (form9.caption='Ведомость материалов')  or (form9.caption='Потребность по материалам в разрезе чертежа')
or  (form9.caption='Отчет по поиску позиций с приоритетом 0 по проекту')
or  (form9.caption='Построечный журнал') or (form9.caption='Ведомость комплектации по помещениям.')
or  (form9.caption='Проверка документов на согласовании к справочнику.')
or  (form9.caption='Потребность по материалам и оборудованию общая по проекту')
or  (form9.caption='Наряды по цеху,проекту')
or  (form9.caption='Наряды с привязкой к УКР с начала постройки по проекту. Выберите проект')
or  (form9.caption='Нормированная тр-ть по цеху в разрезе профессий,разрядов,тарифных сеток по проекту. Выберите проект')
or  (form9.Caption='Суммарная нормированная тр-ть по цеху в разрезе разрядов,тарифных сеток,профессий c привязкой к УКР по проекту. Выберите проект')
or  (form9.Caption='Незакрытые ПУЕ(без МСЧ) по цеху по проекту. Выберите проект')
or  (form9.Caption='Остатки трудоёмкости по МСЧ. Выберите проект')
or  (form9.Caption='Остатки трудоёмкости по ПУЕ(без МСЧ). Выберите проект')
or  (form9.Caption='Количество изделий МСЧ по проекту. Выберите проект')
or  (form9.Caption='Количество покупных изделий с привязкой к ТН,позиции СП по проекту. Выберите проект')
or  (form9.Caption='Запас МСЧ на ЦКС по ячейкам. Выберите проект')
or  (form9.Caption='Укрупнённые помещения по проекту: СП,ПУЕ,УДП')
or  (form9.Caption='Укрупнённые помещения по ТНВ по извещениям по проекту')
or  (form9.Caption='Отёт по привязке ПУЕ к УДП по проекту. Выберите проект')
or  (form9.Caption='УДП по проекту: тр-ть норма,факт,остаток,процент выработки. Выберите проект')
or  (form9.Caption='ОТК: УДП по проекту. Выберите проект')
or  (form9.Caption='УДП: Незакрытые ТК-ПТК в закрытых УДП по проекту. Выберите проект')
or  (form9.Caption='УДП: Заказчик. Выберите проект')
or  (form9.Caption='ПДО: Отчёт по УДП по проекту. Выберите проект')
or  (form9.Caption='ПУЕ с трудоёмкостью 0 с привязкой к УДП по проекту. Выберите проект')
or  (form9.Caption='Оборудование из комплектной поставки для склада ЗИП по проекту. Выберите проект')
or  (form9.Caption='Ведомости снабжения,заказные по проекту. Выберите проект')
or  (form9.Caption='Оборудование по проекту. Выберите проект')
or  (form9.Caption='Перечень закрытой оснастки по проекту. Выберите проект')
or  (form9.Caption='Применяемость ПУЕ: Документы движения,Наряды по проекту. Выберите проект')
or  (form9.caption='Расход по годам в разрезе затребованных и отгруженных материалов по проекту. Выберите проект')
or  (form9.caption='Расход по годам в разрезе затребованного и отгруженного оборудования по проекту. Выберите проект')
or  (form9.caption='Расход по годам в разрезе затребованной номенклатуры по проекту. Выберите проект')
or  (form9.caption='Приходные ордера по отгруженному оборудованию по проекту. Выберите проект')
or  (form9.caption='Приходные ордера по отгруженным материалам по проекту. Выберите проект')
or  (form9.caption='Ведомости снабжения,заказные с привязкой к веткам по проекту. Выберите проект')
or  (form9.caption='Формирование ведомости комплектации запуска.')
or  (form9.Caption='Изделия с незаполненой трудоемкостью ТНа')
or  (form9.Caption='Выберите проект для анализа')
or  (form9.Caption='Проверка дублей ТК и ПТК в проекте')
or  (form9.Caption='Проверка масс (спецификация и справочник)')
or (form9.Caption='Отчёт по сравнению потребности с ведомостями заказа')
or (form9.Caption='Техкомплекты в обеспечении материалами с признаком поступления')
or (form9.Caption='Выгружаем транспортный файл.')
or (self.caption = 'Применяемость позиций по чертежу-документу')
then
begin
  Form9.DBgridEH2.Visible:=false;
  Form9.Button1.Visible:=false;
  if (form9.caption='Наряды по цеху,проекту') or (form9.Caption='Перечень закрытой оснастки по проекту. Выберите проект')
   or (form9.Caption='Запас МСЧ на ЦКС по ячейкам. Выберите проект') then
  Form9.Button1.Visible:=true;

  if self.caption = 'Построечный журнал' then
  begin
    form1.execQuery(OraQuery3, 'SELECT nomer FROM kadry_dep where type_dep_type_dep_id = 2 ORDER BY NOMER ASC', false);
    if OraQuery3.RecordCount < 1 then
      Deps.Visible := false
    else
    begin
      Deps_Label.Visible := true;
      Deps.Visible := true;
      Deps.Clear;

      OraQuery3.First;
      while not OraQuery3.Eof do
      begin
        Deps.Items.Add(OraQuery3.FieldByName('nomer').asString);
        OraQuery3.Next;
      end;
      Deps.ItemIndex := -1;
    end;
  end;
end;

if ((self.Caption = 'Основная номенклатура по дефициту') or (self.caption = 'Требования по дефициту')
or (self.Caption = 'Излишки ТМЦ') or (self.Caption = 'Формирование основной номенклатуры')) then
  Button1.Visible := false;

if (self.caption = 'Отчет по материальной ведомости') then
begin
  //allzakz.Visible := true;
  allzakz.Enabled := true;
	Button1.Visible := false;
  Button2.Visible := true;
  uzaks.Visible := true;
end;

if (self.Caption = 'Дефицит по номенклатуре (новый)') then
begin
  //allzakz.Visible := true;
  allzakz.Enabled := true;
  button1.Visible := false;
  Button2.Visible := true;
  Button2.Caption := 'ОТЧЕТ ПО ДЕФИЦИТУ';
  uzaks.Visible := true;
end;

(*
if (self.Caption = 'Требования по дефициту') then
begin
  //allzakz.Visible := true;
  allzakz.Enabled := true;
  button1.Visible := false;
  Button2.Visible := true;
  Button2.Caption := 'ЗАГРУЗИТЬ ТРЕБОВАНИЯ';
  uzaks.Visible := true;
end;
*)

 if (form9.caption='Построечный журнал') then
  begin
    Label3.Visible:=true;
       ComboBox1.Items.Clear;
    ComboBox1.Items.Add('Списком');
    ComboBox1.Items.Add('Деревом');
    ComboBox1.Items.Add('Списком с планируемым исполнителем');
    ComboBox1.Visible:=true;
  end;
end;

procedure TForm9.DBGridEh1DblClick(Sender: TObject);
var
tx,zak, uzak,part1,part2, SQL, DOCUMENT_ID: string;
e, INC_POS, nField: integer;
FExcel, Sheet, Colum : OleVariant;
begin

if (self.caption = 'Применяемость позиций по чертежу-документу') then
begin
  while DOCUMENT_ID = '' do
  begin
    DOCUMENT_ID := InputBox(self.caption, 'Введите обозначение документа: ', '');
    if (length(DOCUMENT_ID) > 2) then
    begin
      SQL := 'SELECT DOCUMENT_ID, IDENT FROM TRONIX.DOCUMENT WHERE ID_PROJECT = ''' + OraQuery1.FieldByName('project_id').asString
      + ''' AND IDENT like ''%' + DOCUMENT_ID + ''' AND ROWNUM = 1';
      //showmessage(SQL);
      form1.execQuery(OraQuery3, SQL, false);

      DOCUMENT_ID := '';
      if (OraQuery3.RecordCount = 0) then
      begin
        showMessage('Документ не найден! Попробуйте еще раз.');
        continue;
      end;

      if MessageDlg('Построить список ПУЕ по документу: ' + OraQuery3.FieldByName('IDENT').asString + '? (Да - построить; Нет - ввести еще раз)', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DOCUMENT_ID := OraQuery3.FieldByName('DOCUMENT_ID').asString;
        TXList_from_DOCument(DOCUMENT_ID);
      end
      else
        continue;

    end
    else
      break;

  end;

  exit;
end;

if form9.caption='Выгружаем транспортный файл.' then
begin

  Form27.Caption:='Выгружаем транспортный файл. По проекту '+OraQuery1.FieldByName('name').AsString;
  Form27.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
 // Form27.EDIT2.TEXT:=EDIT1.Text;
  Form27.ShowModal();


end;


if form9.caption='Построечный журнал. Подрядчики' then
begin
    Application.CreateForm(TForm50, Form50);

  Form50.Caption:='Построечный журнал. Подрядчики по '+OraQuery1.FieldByName('name').AsString;
  Form50.Project_name:=OraQuery1.FieldByName('name').AsString;
  Form50.Project_zavn:=OraQuery1.FieldByName('zavn').AsString;
  Form50.Project_zak:=OraQuery2.FieldByName('zak').AsString;
  Form50.Project_id:=OraQuery1.FieldByName('project_id').AsString;
   Form50.ShowModal();

end;


if form9.caption='Отчёт по сравнению потребности с ведомостями заказа'
then
 begin
 Form27.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form27.Caption:='Отчёт по сравнению потребности с ведомостями заказа';
  Form27.EDIT2.TEXT:=EDIT1.Text;
  Form27.ShowModal();
end;

if form9.caption='Проверка дублей ТК и ПТК в проекте' then
begin
// Form47.Label2.Caption:=oraQuery1.FieldByName('project_id').asString;
  with  Form47 DO
    begin
      Caption:='Проверка дублей ТК и ПТК в проекте';
tx:=' Select NOMER, ';
tx:=tx+' (Select NOMER from tx_texkompl  where texkompl_id=tx.texkompl_texkompl_id)  as UROVEN,';
tx:=tx+' (Select FIO from tronix.izm where  ID=texkompl_id and IZM=''I'' and key= NOMER)  FIO,';
tx:=tx+' (Select DAT from tronix.izm where  ID=texkompl_id and IZM=''I'' and key= NOMER) DAT';
//tx:=tx+'  tx.texkompl_id ';
tx:=tx+' from tx_texkompl tx ';
tx:=tx+' where tx.texkompl_id in ';
tx:=tx+' ( ';
tx:=tx+' Select texkompl_id from tx_texkompl ';
tx:=tx+' where nomer in ';
tx:=tx+' ( ';
tx:=tx+' Select nomer from ';
tx:=tx+' ( ';
tx:=tx+' Select nomer,count(*) k ';
tx:=tx+' from tx_texkompl ';
tx:=tx+' where ';
tx:=tx+' project_project_id='+Form9.oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and type_tex_type_tex_id in (7,12) ';
tx:=tx+' group by nomer ';
tx:=tx+' ) ';
tx:=tx+' where k>1 ';
tx:=tx+' ) ';
tx:=tx+' and project_project_id='+Form9.oraQuery1.FieldByName('project_id').asString;
tx:=tx+' ) ';
tx:=tx+' order by NOMER,DAT ';
      OraQuery1.SQL.Text:=tx;

      OraQuery1.ExecSQL;
 end;
  Close();
  Form47.ShowModal();

end;

if (form9.caption = 'Отчет по материальной ведомости') and (Sender <> nil) then
	exit;

if ((form9.caption='Отчет по материальной ведомости') or (self.caption = 'NORMSPENTMAT_FOR_COST_BYPROJECT')) then
begin

  if (self.caption <> 'NORMSPENTMAT_FOR_COST_BYPROJECT') then
  begin
	  uzak := '-1';
	  for e := 0 to uzaks.Items.Count - 1 do
		  if uzaks.Checked[e] then
			  uzak := uzak + ', ' + uzaks_memory.Items[e];

	  if uzak = '-1' then
	  begin
		  showmessage('Выберите минимум 1 заказ!');
		  exit;
	  end;
  end
  else
    uzak := 'select NN from tronix.zakaz where id_project = ' + OraQuery1.FieldByName('project_id').asString;

	tx:=' SELECT <MTR_MASK> I.CED, I.CED_UCHET, I.PART,I.PART2,SUBSTR(I.KOD,1,4) GRP_KOD,I.SUBGRP,I.GOST_CHART_POST GOST,I.KOD,I.MARKA,I.TYPE_RAZM,I.DOP_NAME,I.GOST_TY,I.GOST_MAT, ';
	tx:=tx+' RTRIM(I.MARKA || DECODE(I.TYPE_RAZM, NULL ,'''','' '')  || I.TYPE_RAZM  || DECODE(I.GOST_TY, NULL ,'''','' '')  || I.GOST_TY  || DECODE(I.GOST_MAT, NULL ,'''','' '')  || I.GOST_MAT ) MAT, ';
	tx:=tx+' UPPER(I.ED) ED,REPLACE(TO_CHAR(I.POTR),''.'','','') POTR,UPPER(I.ED_UCHET) ED_UCHET,REPLACE(TO_CHAR(I.POTR_UCHET),''.'','','') POTR_UCHET,';
	//tx:=tx+' REPLACE(TO_CHAR(I.MASS),''.'','','') MASS ';
	//tx:=tx+' REPLACE(TO_CHAR(DECODE(I.MASS,0,I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,I.KODED_KODED_ID,10)),''.'','','')) MASS ';
	//tx:=tx+' DECODE(NVL(I.MASS,0),0,(I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where NAMEK=I.ED),10)),I.MASS) MASS ,round(POTR*nvl(1/tronix.kof_ispolz_mat(sprav_id),0),9) kof_isp';
	tx:=tx+' DECODE(NVL(I.MASS,0),0,(I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where koded_id=I.koded_id),10)),I.MASS) MASS , ';
	//13.02.2019 tx:=tx+' DECODE(NVL(I.MASS,0),0,(I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where NAMEK=I.ED),10)),I.MASS) MASS , ';
	//tx:=tx+' round((I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where NAMEK=I.ED),10))*nvl(1/tronix.kof_ispolz_mat(sprav_id),0),9) kof_isp';
	//13.02.2019tx:=tx+' round((I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where NAMEK=I.ED),10))*';
	//tx:=tx+' round((I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where koded_id=I.koded_id),10)) * I.defkof, 9) as kof_isp, ';
	//tx:=tx+'I.defkof as defkof ';
	tx:=tx+' round((I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where koded_id=I.koded_id),10)) * ';
	tx:=tx+'nvl((Select max(k.ki) ';
	tx:=tx+' FROM ';
	tx:=tx+'TRONIX.SPRAV S, ';
	tx:=tx+'TRONIX.T24P2 K, ';
	tx:=tx+'TRONIX.T24P1 ZK ';
	tx:=tx+' WHERE ';
	tx:=tx+' ZK.NPP=1 ';
	tx:=tx+' AND  ZK.NPP=K.NPP ';
	tx:=tx+' AND S.SPRAV_ID=I.SPRAV_ID ';
	tx:=tx+' AND I.KOD>=K.KOD1 ';
	tx:=tx+' AND I.KOD<=K.KOD2 ';
	tx:=tx+' AND K.KI>0),0),9) as kof_isp, nvl((Select max(k.ki) FROM TRONIX.SPRAV S, TRONIX.T24P2 K, '
	+ 'TRONIX.T24P1 ZK WHERE ZK.NPP=1 AND  ZK.NPP=K.NPP AND S.SPRAV_ID=I.SPRAV_ID AND I.KOD>=K.KOD1 AND '
	+ 'I.KOD<=K.KOD2 AND K.KI>0),0) as defkof ';

	//nvl(1/tronix.kof_ispolz_mat(sprav_id),0),9) kof_isp';
	tx:=tx+'   FROM (SELECT DISTINCT REPLACE(UPPER(L1.NAME),CHR(9),'' '') PART, ';
	tx:=tx+' REPLACE(UPPER(L2.name),CHR(9),'' '') PART2, ';
	tx:=tx+' REPLACE(UPPER(SPR.NAME),CHR(9),'' '') SUBGRP, ';
	tx:=tx+' A.SPRAV_ID, ';
	tx:=tx+' SPR.KOD,REPLACE(UPPER(LTRIM(SPR.DOP_NAME)),CHR(9),'' '') DOP_NAME,A.KODED_ID_UCHET,A.KODED_ID, ';
	tx:=tx+' TRONIX_KODED.NAMEK ED, ';
	tx:=tx+' TRONIX_KODED.KODED CED, '; //15.02.2019
	tx:=tx+' KODED_UCHET.NAMEK ED_UCHET, ';
	tx:=tx+' KODED_UCHET.KODED CED_UCHET, '; //15.02.2019
	tx:=tx+' ROUND(A.POTR,4) POTR, ';
	tx:=tx+' ROUND(A.POTR_UCHET,4) POTR_UCHET, ';
	tx:=tx+' ROUND(A.MASS,4) MASS, ';
	tx:=tx+' REPLACE(UPPER(LTRIM(TTR.NAME)),CHR(9),'' '') TYPE_RAZM, ';
	tx:=tx+' REPLACE(UPPER(LTRIM(TTI.NAME)),CHR(9),'' '') MARKA,REPLACE(UPPER(TTL.NAME),CHR(9),'' '') GOST_CHART_POST, ';
	tx:=tx+' REPLACE(UPPER(TTY.NAME),CHR(9),'' '') GOST_TY,REPLACE(UPPER(TTM.NAME),CHR(9),'' '') GOST_MAT ';
	tx:=tx+' FROM TRONIX_KODED,TRONIX_KODED KODED_UCHET,TRONIX_SPRAV SPR,TRONIX_TREE L0, ';
	tx:=tx+' TRONIX_TREE L1,TRONIX_TREE L2,TRONIX_TREE L3,TRONIX_TREE L4,TRONIX_TYP_LOV TTL,TRONIX_TYM_LOV TTM,TRONIX_TIP_LOV TTI, ';
	tx:=tx+' TRONIX_RAZ_LOV TTR,TRONIX_TY_LOV TTY, ';
	tx:=tx+' (SELECT ALL AA.SPRAV_ID,AA.KODED_ID,AA.KODED_ID_UCHET,SUM(AA.POTR) POTR, ';
	tx:=tx+' SUM(AA.POTR_UCHET) POTR_UCHET,SUM(AA.MASS) MASS ';
	tx:=tx+'  FROM (SELECT ALL B.SPRAV_ID,B.DEP_ID,B.KODED_ID,B.KODED_ID_UCHET,SUM(B.KOL_POTR * B.KOF ) POTR, ';
	tx:=tx+' SUM(B.KOL_POTR * B.KOF_UCHET ) POTR_UCHET,SUM(B.MASS) MASS ';
	tx:=tx+'   FROM (SELECT DISTINCT C.SPRAV_ID,C.DEP_ID,C.KODED_ID_UCHET,C.KODED_ID,C.KOL_POTR,C.MASS, ';
	tx:=tx+' TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,C.KODED_ID_UCHET) KOF_UCHET, ';
	tx:=tx+' TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,C.KODED_ID) KOF ';
	tx:=tx+'    FROM (SELECT ALL TX_CAR_POTR.SPRAV_SPRAV_ID SPRAV_ID, ';
	tx:=tx+' TX_CAR_POTR.DEP_DEP_ID DEP_ID, ';
	tx:=tx+' TRONIX_SPRAV.KODED_KODED_ID KODED_ID, ';
	tx:=tx+' NVL(TRONIX_SPRAV.KODED_KODED_ID2, ';
	tx:=tx+' TRONIX_SPRAV.KODED_KODED_ID) KODED_ID_UCHET, ';
	tx:=tx+' TX_CAR_POTR.KODED_KODED_ID KODED_ID_POTR,SUM(TX_CAR_POTR.KOL) KOL_POTR, ';
	/// ??? ??? ??????? ??????????? ????
	//tx:=tx+' SUM(KART_SP.MASS) MASS   FROM TX_CAR_POTR,KART_SP,TRONIX_SPRAV ';
	///??????
	///tx:=tx+' SUM(DECODE((Select count(*) from tronix.sostav where sprav_sprav_id=KART_SP.ID_SPRAV),0,KART_SP.MASS,TX_CAR_POTR.KOL* TRONIX_KOF_KODED(TX_CAR_POTR.SPRAV_SPRAV_ID ,TX_CAR_POTR.KODED_KODED_ID,10))) MASS FROM TX_CAR_POTR,KART_SP,TRONIX_SPRAV ';
	tx:=tx+'DECODE((Select count(*) from tronix.sostav where sprav_sprav_id=KART_SP.ID_SPRAV),0,SUM(KART_SP.MASS)/count(KART_SP.NN),SUM(TX_CAR_POTR.KOL* TRONIX_KOF_KODED(TX_CAR_POTR.SPRAV_SPRAV_ID ,TX_CAR_POTR.KODED_KODED_ID,10))) MASS, ';
	tx:=tx+'  KART_SP.id_sprav ';
	////
	tx:=tx+' FROM TX_CAR_POTR,KART_SP,TRONIX_SPRAV ';
	tx:=tx+'   WHERE TX_CAR_POTR.SPRAV_SPRAV_ID = TRONIX_SPRAV.SPRAV_ID ';
	tx:=tx+'  AND NVL(TRONIX_SPRAV.CAN_DO_SELF,0) != 1 ';
	tx:=tx+'  AND TX_CAR_POTR.SP_ID_FROM = KART_SP.NN  AND (TX_CAR_POTR.UZAK_UZAK_ID in (' + uzak + ') ) ';
	tx:=tx+'  AND (TX_CAR_POTR.PROJECT_PROJECT_ID = '+oraQuery1.FieldByName('project_id').asString+'  OR '+oraQuery1.FieldByName('project_id').asString+' IS NULL ) ';
	tx:=tx+' GROUP BY TX_CAR_POTR.SPRAV_SPRAV_ID,NVL(TRONIX_SPRAV.KODED_KODED_ID2,TRONIX_SPRAV.KODED_KODED_ID), ';
	tx:=tx+' TRONIX_SPRAV.KODED_KODED_ID, ';
	/// ????? ???? ???????? ???????????
	tx:=tx+' TX_CAR_POTR.KODED_KODED_ID,TX_CAR_POTR.DEP_DEP_ID , KART_SP.NN, KART_SP.id_sprav) C ) B ';
	tx:=tx+'  GROUP BY B.SPRAV_ID,B.DEP_ID,B.KODED_ID,B.KODED_ID_UCHET ';
	tx:=tx+'   UNION ALL ';

	///tx:=tx+' SELECT BB.SPRAV_ID,BB.DEP_ID,BB.KODED_ID,BB.KODED_ID_UCHET, ';
	///tx:=tx+' BB.POTR,BB.POTR_UCHET, ';
	///tx:=tx+' SP.MASS ';
	///tx:=tx+' FROM ';
	///tx:=tx+' (SELECT ALL B.SPRAV_ID,B.DEP_ID,B.KODED_ID,B.KODED_ID_UCHET,SUM(B.KOL_POTR * B.KOF ) POTR, ';
	///tx:=tx+' SUM(B.KOL_POTR * B.KOF_UCHET ) POTR_UCHET ';
	///tx:=tx+'  FROM ';
	///tx:=tx+' (SELECT DISTINCT C.SPRAV_ID,C.DEP_ID,C.KODED_ID_UCHET,C.KODED_ID,C.KOL_POTR,TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,C.KODED_ID_UCHET) KOF_UCHET, ';
	///tx:=tx+'  TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,C.KODED_ID) KOF ';
	///tx:=tx+'  FROM (SELECT ALL TX_CAR_POTR.SPRAV_SPRAV_ID SPRAV_ID,TX_CAR_POTR.DEP_DEP_ID DEP_ID,TRONIX_SPRAV.KODED_KODED_ID KODED_ID, ';
	///tx:=tx+' NVL(TRONIX_SPRAV.KODED_KODED_ID2,TRONIX_SPRAV.KODED_KODED_ID) KODED_ID_UCHET, ';
	///tx:=tx+' TX_CAR_POTR.KODED_KODED_ID KODED_ID_POTR,SUM(TX_CAR_POTR.KOL) KOL_POTR ';
	///tx:=tx+'  FROM TX_CAR_POTR,TRONIX_SPRAV ';
	///tx:=tx+'     WHERE ';
	///tx:=tx+' TX_CAR_POTR.SPRAV_SPRAV_ID = TRONIX_SPRAV.SPRAV_ID  AND NVL(TRONIX_SPRAV.CAN_DO_SELF,0) != 1 ';
	///tx:=tx+'  AND TX_CAR_POTR.SP_ID_FROM IS NULL  AND (TX_CAR_POTR.UZAK_UZAK_ID = '+ uzak +' OR '+uzak +' IS NULL ) ';
	///tx:=tx+' AND (TX_CAR_POTR.PROJECT_PROJECT_ID = '+oraQuery1.FieldByName('project_id').asString+'  OR '+oraQuery1.FieldByName('project_id').asString+' IS NULL ) ';
	///tx:=tx+'         GROUP BY ';
	///tx:=tx+'     TX_CAR_POTR.SPRAV_SPRAV_ID, ';
	///tx:=tx+'     NVL(TRONIX_SPRAV.KODED_KODED_ID2, ';
	///tx:=tx+'     TRONIX_SPRAV.KODED_KODED_ID), ';
	///tx:=tx+'     TRONIX_SPRAV.KODED_KODED_ID, ';
	///tx:=tx+'       TX_CAR_POTR.KODED_KODED_ID, ';
	///tx:=tx+'          TX_CAR_POTR.DEP_DEP_ID ) C ) B ';
	///tx:=tx+'      GROUP BY ';
	///tx:=tx+'    B.SPRAV_ID, ';
	///tx:=tx+'      B.DEP_ID, ';
	///tx:=tx+'        B.KODED_ID, ';
	///tx:=tx+'          B.KODED_ID_UCHET ) BB, ';
	///tx:=tx+'         (SELECT SP1.SPRAV_SPRAV_ID,SP1.DEP_DEP_ID,SUM(SP1.MASS) MASS ';
	///tx:=tx+'          FROM (SELECT SP0.SPRAV_SPRAV_ID,SP0.DEP_DEP_ID,SP0.MASS ';
	///tx:=tx+'          FROM (SELECT TX_ZAMEN_MAT_SP(SP.ID_SPRAV,D.ID_PROJECT, NULL , NULL , NULL ,SP.NN) SPRAV_SPRAV_ID, ';
	///tx:=tx+'         TX_SKLAD_FOR(TK.DEP_DEP_ID) DEP_DEP_ID,SP.MASS ';
	///tx:=tx+'         FROM TX_CAR_POTR P,KART_SP SP,TX_TEXKOMPL TK,TRONIX_DOCUMENT D, ';
	///tx:=tx+'         (SELECT DOCUMENT_TYPE_ID DOCUMENT_TYPE_ID   FROM TRONIX_DOCUMENT_TYPE  WHERE TYPE != ''??''  AND TYPE != ''??'' ) TD  WHERE SP.NN = P.SP_ID_FROM (+) ';
	///tx:=tx+'         AND P.SP_ID_FROM IS NULL  AND TX_GET_TX_MARSH(''FIRST'',TX_LOAD_MARSH(SP.NN)) = TK.TEXKOMPL_ID ';
	///tx:=tx+'        AND (D.ID_PROJECT =' +oraQuery1.FieldByName('project_id').asString+'  OR '+oraQuery1.FieldByName('project_id').asString+' IS NULL ) ';
	///tx:=tx+'      AND D.DOCUMENT_ID = SP.NNN  AND D.ID_DOCUMENT_TYPE = TD.DOCUMENT_TYPE_ID ) SP0, ';
	///tx:=tx+'     TRONIX_SPRAV S  WHERE SP0.SPRAV_SPRAV_ID = S.SPRAV_ID  AND NVL(S.CAN_DO_SELF,0) != 1 ) SP1 ';
	///tx:=tx+'       GROUP BY SP1.SPRAV_SPRAV_ID,SP1.DEP_DEP_ID ) SP ';
	///tx:=tx+'    WHERE BB.SPRAV_ID || ''|''  || BB.DEP_ID  = SP.SPRAV_SPRAV_ID (+)   || ''|''  || SP.DEP_DEP_ID (+) ';

	tx:=tx+' SELECT ';
	(*tx:=tx+'nvl((Select max(k.ki) FROM TRONIX.SPRAV S, TRONIX.T24P2 K, '
	+ 'TRONIX.T24P1 ZK WHERE ZK.NPP=1 AND  ZK.NPP=K.NPP AND S.SPRAV_ID=SPRAV_ID AND S.KOD>=K.KOD1 AND '
	+ 'S.KOD<=K.KOD2 AND K.KI>0),0) as defkof, ';*)
	tx:=tx+'  SPRAV_ID,DEP_ID,KODED_ID,KODED_ID_UCHET, ';
	tx:=tx+'   POTR,POTR_UCHET ,MASS    ';
	tx:=tx+'   FROM (                ';
	tx:=tx+'  Select SPRAV_ID,dep_id,KODED_ID,KODED_ID_UCHET, SUM( POTR) POTR,SUM( POTR_UCHET) POTR_UCHET, ';
	tx:=tx+'  SUM(decode(mass,null,(TRONIX_KOF_KODED(SPRAV_ID,KODED_ID,10)*POTR),MASS)) MASS ';
	tx:=tx+'  from( ';
	tx:=tx+'  Select SPRAV_ID,0 dep_id,KODED_ID,KODED_ID_UCHET, sum(POTR)  POTR, ';
	tx:=tx+'   sum(POTR_UCHET)  POTR_UCHET, ';
	tx:=tx+'  (Select  sum(TRONIX_KOF_KODED(sprav_sprav_id_sostav,koded_koded_id,10)*kol) ';
	tx:=tx+'  from  tronix.sostav ';
	tx:=tx+'  where sprav_sprav_id_sostav=SPRAV_ID ';
	tx:=tx+'  connect by prior sprav_sprav_id_sostav=sprav_sprav_id ';
	tx:=tx+'  start with sprav_sprav_id=spr_msc )*sum(POTR)*TRONIX_KOF_KODED( SPRAV_ID,KODED_ID,10)/ ';
	tx:=tx+'  (Select  sum(TRONIX_KOF_KODED(sprav_sprav_id_sostav,koded_koded_id,10)*ki)  MASS ';
	tx:=tx+'  from  tronix.sostav ';
	tx:=tx+'  where sprav_sprav_id_sostav=SPRAV_ID ';
	tx:=tx+'  connect by prior sprav_sprav_id_sostav=sprav_sprav_id ';
	tx:=tx+'  start with sprav_sprav_id=spr_msc )   MASS ';
	tx:=tx+'  from ';
	tx:=tx+'  (SELECT ALL B.SPRAV_ID,B.DEP_ID,B.KODED_ID,B.KODED_ID_UCHET,SUM(B.KOL_POTR * B.KOF ) POTR, ';
	tx:=tx+'   SUM(B.KOL_POTR * B.KOF_UCHET ) POTR_UCHET ';
	tx:=tx+'  ,b.nomer,SUBSTR(b.nomer, INSTR(b.nomer,''/'',1,1)+1, INSTR(b.nomer ,''/'',1,2)-INSTR(b.nomer,''/'',1,1)-1)  , ';
	tx:=tx+'  (Select sprav_id from tronix.sprav where kod=SUBSTR(b.nomer, INSTR(b.nomer,''/'',1,1)+1, INSTR(b.nomer ,''/'',1,2)-INSTR(b.nomer,''/'',1,1)-1)) spr_msc ';
	tx:=tx+'    FROM ';
	tx:=tx+'   (SELECT DISTINCT C.SPRAV_ID,C.DEP_ID,C.KODED_ID_UCHET,C.KODED_ID,C.KOL_POTR,TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,C.KODED_ID_UCHET) KOF_UCHET, ';
	tx:=tx+'    TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,C.KODED_ID) KOF ';
	tx:=tx+'  , (Select nomer from tx_texkompl where texkompl_id=c.texkompl_texkompl_id) nomer ';
	tx:=tx+'   FROM (SELECT ALL TX_CAR_POTR.SPRAV_SPRAV_ID SPRAV_ID,TX_CAR_POTR.DEP_DEP_ID DEP_ID,TRONIX_SPRAV.KODED_KODED_ID KODED_ID, ';
	tx:=tx+'   NVL(TRONIX_SPRAV.KODED_KODED_ID2,TRONIX_SPRAV.KODED_KODED_ID) KODED_ID_UCHET, ';
	tx:=tx+'   TX_CAR_POTR.KODED_KODED_ID KODED_ID_POTR,SUM(TX_CAR_POTR.KOL) KOL_POTR ';
	tx:=tx+'  ,TX_CAR_POTR.texkompl_texkompl_id ';
	tx:=tx+'    FROM TX_CAR_POTR,TRONIX_SPRAV ';
	tx:=tx+'       WHERE ';
	tx:=tx+'   TX_CAR_POTR.SPRAV_SPRAV_ID = TRONIX_SPRAV.SPRAV_ID  AND NVL(TRONIX_SPRAV.CAN_DO_SELF,0) != 1 ';
	tx:=tx+'    AND TX_CAR_POTR.SP_ID_FROM IS NULL  AND (TX_CAR_POTR.UZAK_UZAK_ID in (' + uzak + ') ) ';
	tx:=tx+'   AND (TX_CAR_POTR.PROJECT_PROJECT_ID =' +oraQuery1.FieldByName('project_id').asString+ ' OR ' +oraQuery1.FieldByName('project_id').asString+ ' IS NULL) ';
	tx:=tx+'           GROUP BY ';
	tx:=tx+'       TX_CAR_POTR.SPRAV_SPRAV_ID, ';
	tx:=tx+'       NVL(TRONIX_SPRAV.KODED_KODED_ID2, ';
	tx:=tx+'       TRONIX_SPRAV.KODED_KODED_ID), ';
	tx:=tx+'       TRONIX_SPRAV.KODED_KODED_ID, ';
	tx:=tx+'         TX_CAR_POTR.KODED_KODED_ID, ';
	tx:=tx+'            TX_CAR_POTR.DEP_DEP_ID ';
	tx:=tx+'  ,TX_CAR_POTR.texkompl_texkompl_id ';
	tx:=tx+'  ) C ) B ';
	tx:=tx+'        GROUP BY ';
	tx:=tx+'      B.SPRAV_ID, ';
	tx:=tx+'          B.KODED_ID, ';
	tx:=tx+'   B.dep_ID, ';
	tx:=tx+'   B.KODED_ID_UCHET ';
	tx:=tx+'  ,b.nomer) ';
	tx:=tx+'  group by SPRAV_ID, KODED_ID,KODED_ID_UCHET,spr_msc) ';
	tx:=tx+'  Group by SPRAV_ID, dep_id,KODED_ID,KODED_ID_UCHET) ';
	tx:=tx+'    UNION ALL SELECT S2.SPRAV_ID,TX_SKLAD_FOR(DS.DEP_DEP_ID) DEP_DEP_ID,S2.KODED_KODED_ID KODED_ID,NVL(S2.KODED_KODED_ID2,S2.KODED_KODED_ID) KODED_ID_UCHET, ';
	tx:=tx+'    TO_NUMBER( NULL ) POTR,  TO_NUMBER( NULL ) POTR_UCHET, '; //30072015
	//30072015//tx:=tx+'  S1.KOL * l1.KI  * TRONIX_KOF_KODED(S2.SPRAV_ID,L1.KODED_KODED_ID,S2.KODED_KODED_ID) POTR, ';
	//30072015//tx:=tx+'  S1.KOL * l1.KI  * TRONIX_KOF_KODED(S2.SPRAV_ID,L1.KODED_KODED_ID,NVL(S2.KODED_KODED_ID2,S2.KODED_KODED_ID))  POTR_UCHET, ';

	tx:=tx+'  S1.KOL * L1.KOL  * TRONIX_KOF_KODED(S2.SPRAV_ID,L1.KODED_KODED_ID,10)  MASS  ';
	tx:=tx+'        FROM TRONIX_SOSTAV L1, ';
	tx:=tx+'        TRONIX_SOSTAV_1LEVEL_MSC L2, ';
	tx:=tx+'        TRONIX_SPRAV S2, ';
	tx:=tx+'    (SELECT U.SPRAV_SPRAV_ID,TO_NUMBER(SUBSTR(U.N_DEP,7)) DEP_DEP_ID   FROM (SELECT TX.SPRAV_SPRAV_ID,MIN(TO_CHAR(OP.NOMER,''99999'') || TO_CHAR(OP.DEP_DEP_ID) ) N_DEP ';
	tx:=tx+'    FROM TX_ZTEXNOLOGI TX,TX_OPERATION OP  WHERE TX.ZTEXNOLOGI_ID = OP.ZTEXNOLOGI_ZTEXNOLOGI_ID  GROUP BY TX.SPRAV_SPRAV_ID ) U ) DS, ';
	tx:=tx+'   (SELECT ALL B.SPRAV_ID,SUM(B.KOL) KOL   FROM (SELECT DISTINCT C.SPRAV_ID,C.KOL,TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,10) KOF ';
	tx:=tx+'   FROM (SELECT ALL TX_CAR_POTR.SPRAV_SPRAV_ID SPRAV_ID,SUM(TX_CAR_POTR.KOL) KOL, ';
	tx:=tx+'   TX_CAR_POTR.KODED_KODED_ID KODED_ID_POTR ';
	tx:=tx+'   FROM TX_CAR_POTR, ';
	tx:=tx+'   TRONIX_SPRAV ';
	tx:=tx+'   WHERE TX_CAR_POTR.SPRAV_SPRAV_ID = TRONIX_SPRAV.SPRAV_ID ';
	tx:=tx+'   AND NVL(TRONIX_SPRAV.CAN_DO_SELF,0) = 1 ';
	tx:=tx+'  AND (TX_CAR_POTR.UZAK_UZAK_ID in (' + uzak + ') ) ';
	tx:=tx+'    AND (TX_CAR_POTR.PROJECT_PROJECT_ID = '+oraQuery1.FieldByName('project_id').asString+'  OR '+oraQuery1.FieldByName('project_id').asString+' IS NULL  ) ';
	tx:=tx+' GROUP BY TX_CAR_POTR.SPRAV_SPRAV_ID,TX_CAR_POTR.KODED_KODED_ID ) C ) B ';
	tx:=tx+'    GROUP BY B.SPRAV_ID ) S1 ';
	tx:=tx+'   WHERE NVL(L2.CAN_DO_SELF,0) = 1 ';
	tx:=tx+'    AND NVL(S2.CAN_DO_SELF,0) != 1 ';
	tx:=tx+'   AND NVL(L2.ROSSIP,0) = 0 ';
	tx:=tx+'   AND L2.SPRAV_SPRAV_ID_SOSTAV = L1.SPRAV_SPRAV_ID ';
	tx:=tx+'   AND TRONIX_SELECT_MAT(S2.TREE_TREE_ID,''01'') = 1 ';
	tx:=tx+'  AND L1.SPRAV_SPRAV_ID_SOSTAV = S2.SPRAV_ID ';
	tx:=tx+'   AND L2.SPRAV_SPRAV_ID = S1.SPRAV_ID ';
	tx:=tx+'  AND DS.SPRAV_SPRAV_ID = L1.SPRAV_SPRAV_ID ';
	tx:=tx+'  UNION ALL ';
	tx:=tx+' SELECT SP.SPRAV_SPRAV_ID SPRAV_ID,SP.DEP_DEP_ID DEP_ID,SP.KODED_KODED_ID KODED_ID,NVL(SP.KODED_KODED_ID2,SP.KODED_KODED_ID) KODED_ID_UCHET, ';
	tx:=tx+'  TO_NUMBER( NULL ) POTR,TO_NUMBER( NULL ) POTR_UCHET,SP.MASS ';
	tx:=tx+'  FROM (SELECT SP1.SPRAV_SPRAV_ID,SP1.DEP_DEP_ID,SP1.KODED_KODED_ID, ';
	tx:=tx+'   SP1.KODED_KODED_ID2,SUM(SP1.MASS) MASS ';
	tx:=tx+'  FROM (SELECT SP0.SPRAV_SPRAV_ID,SP0.DEP_DEP_ID,SP0.MASS,S.KODED_KODED_ID,S.KODED_KODED_ID2 ';
	tx:=tx+'  FROM (SELECT TX_ZAMEN_MAT_SP(SP.ID_SPRAV,D.ID_PROJECT, NULL , NULL , NULL ,SP.NN) SPRAV_SPRAV_ID, ';
	tx:=tx+'  TX_SKLAD_FOR(TK.DEP_DEP_ID) DEP_DEP_ID,SP.MASS ';
	tx:=tx+'  FROM TX_CAR_POTR P,KART_SP SP,TX_TEXKOMPL TK, ';
	tx:=tx+' TRONIX_DOCUMENT D,(SELECT DOCUMENT_TYPE_ID DOCUMENT_TYPE_ID   FROM TRONIX_DOCUMENT_TYPE  WHERE TYPE != ''??''  AND TYPE != ''??'' ) TD ';
	tx:=tx+'        WHERE SP.ID_SPRAV = P.SPRAV_SPRAV_ID (+) ';
	tx:=tx+'   AND P.SPRAV_SPRAV_ID IS NULL ';
	tx:=tx+' AND TX_GET_TX_MARSH(''FIRST'',TX_LOAD_MARSH(SP.NN)) = TK.TEXKOMPL_ID (+) ';
	tx:=tx+' AND (D.ID_PROJECT = '+oraQuery1.FieldByName('project_id').asString+'  OR '+oraQuery1.FieldByName('project_id').asString+' IS NULL ) ';
	tx:=tx+' AND D.DOCUMENT_ID = SP.NNN ';
	tx:=tx+' AND D.ID_DOCUMENT_TYPE = TD.DOCUMENT_TYPE_ID ) SP0, ';
	tx:=tx+' TRONIX_SPRAV S  WHERE SP0.SPRAV_SPRAV_ID = S.SPRAV_ID  AND NVL(S.CAN_DO_SELF,0) != 1 ) SP1 ';
	tx:=tx+' GROUP BY SP1.SPRAV_SPRAV_ID,SP1.DEP_DEP_ID, ';
	tx:=tx+' SP1.KODED_KODED_ID,SP1.KODED_KODED_ID2 ) SP ';
	tx:=tx+' WHERE NVL(SP.MASS,0) != 0 ) AA ';
	tx:=tx+' GROUP BY AA.SPRAV_ID,AA.KODED_ID,AA.KODED_ID_UCHET ) A ';
	tx:=tx+' WHERE ';
	tx:=tx+' A.KODED_ID = TRONIX_KODED.KODED_ID (+) ';
	tx:=tx+' AND A.KODED_ID_UCHET = KODED_UCHET.KODED_ID (+) ';
	tx:=tx+' and A.SPRAV_ID = SPR.SPRAV_ID ';
	tx:=tx+' AND L0.KOD = ''01''';
	tx:=tx+'  AND L0.TREE_ID = L1.TREE_TREE_ID ';
	tx:=tx+'  AND L1.TREE_ID = L2.TREE_TREE_ID (+) ';
	tx:=tx+'  AND L2.TREE_ID = L3.TREE_TREE_ID (+) ';
	tx:=tx+'  AND L3.TREE_ID = L4.TREE_TREE_ID (+) ';
	tx:=tx+'  AND (SPR.TREE_TREE_ID = L1.TREE_ID  OR SPR.TREE_TREE_ID = L2.TREE_ID  OR SPR.TREE_TREE_ID = L3.TREE_ID  OR SPR.TREE_TREE_ID = L4.TREE_ID ) ';
	tx:=tx+'  AND SPR.TYP_LOV_TYP_LOV_ID = TTL.TYP_LOV_ID (+) ';
	tx:=tx+'  AND SPR.TYM_LOV_TYM_LOV_ID = TTM.TYM_LOV_ID (+) ';
	tx:=tx+' AND SPR.TIP_LOV_TIP_LOV_ID = TTI.TIP_LOV_ID (+) ';
	tx:=tx+'  AND SPR.RAZ_LOV_RAZ_LOV_ID = TTR.RAZ_LOV_ID (+) ';
	tx:=tx+' AND SPR.TY_LOV_TY_LOV_ID = TTY.TY_LOV_ID (+)) I  ';
	tx:=tx+' ORDER BY <ORDER_MASK>';
	//tx:=tx+' ORDER BY I.KOD, I.SPRAV_ID';
	//       ShowMEssage(tx);

  if (self.caption = 'NORMSPENTMAT_FOR_COST_BYPROJECT') then
  begin
    tx := StringReplace(tx, '<MTR_MASK>', 'substr(upper(ltrim(tronix_sp_sp_name(I.SPRAV_ID, null, 3))), 1, 200) as MTR_NAME,', [rfReplaceAll, rfIgnoreCase]);
    tx := StringReplace(tx, '<ORDER_MASK>', 'I.KOD ASC', [rfReplaceAll, rfIgnoreCase]);
    form1.execQuery(OraQuery3, tx, false);

    FExcel := CreateOleObject('Excel.Application');
    FExcel.Workbooks.Add;
    FExcel.EnableEvents := False;
    FExcel.Visible := false;
    FExcel.WorkSheets[1].Select;
    FExcel.Workbooks[1].WorkSheets[1].Name := 'Лист1';
    INC_POS := 1;

    //for e := 0 to (OraQuery3.Fields.Count - 1) do
    //  FExcel.Cells[INC_POS, (e + 1)].Value := OraQuery3.Fields[e].FieldName;
    FExcel.Cells[INC_POS, 1].Value := 'NAME';
    FExcel.Cells[INC_POS, 2].Value := 'KOD';
    FExcel.Cells[INC_POS, 3].Value := 'ED';
    FExcel.Cells[INC_POS, 4].Value := 'NORM';
    inc(INC_POS);

    OraQuery3.First;
    while not OraQuery3.Eof do
    begin
      nField := 1;
      for e := 1 to OraQuery3.Fields.Count do
      begin

        tx := OraQuery3.Fields[(e - 1)].FieldName;
        if ((tx = 'MTR_NAME') or (tx = 'KOD') or (tx = 'ED')) then
        begin
          FExcel.Cells[INC_POS, nField].NumberFormat := '@';
          FExcel.Cells[INC_POS, nField].Value := OraQuery3.FieldByName(TX).asString;
          inc(nField);
        end
        else if (tx = 'POTR') then
        begin
          FExcel.Cells[INC_POS, nField].Value := excelFloat(OraQuery3.FieldByName(TX).asString);
          inc(nField);
        end
        else
          continue;

      end;

      OraQuery3.Next;
      inc(INC_POS);
    end;

    FExcel.Visible := true;
    FExcel := Unassigned;

    showmessage('Выгружено ' + inttostr(OraQuery3.RecordCount) + ' строк(и).');
    exit;
  end;

  tx := StringReplace(tx, '<MTR_MASK>', '', [rfReplaceAll, rfIgnoreCase]);
  tx := StringReplace(tx, '<ORDER_MASK>', 'I.PART,I.part2, GRP_KOD, TO_NUMBER(I.KOD) ASC', [rfReplaceAll, rfIgnoreCase]);

	if MessageDlg('Создать отчет в новом варианте? Да - новый вариант. Нет - старый вариант.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
	begin
		SQL := tx;

		FExcel := CreateOleObject('Excel.Application');
		FExcel.EnableEvents := False;
		FExcel.Visible := false;

		//FExcel.Workbooks.Open('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_F58.xlsx');
		FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_F58.xlsx');
		FExcel.Workbooks[1].WorkSheets[1].Name := 'Ведомость';
		Colum := FExcel.Workbooks[1].WorkSheets['Ведомость'].Columns;

		Sheet:=FExcel.Workbooks[1].WorkSheets['Ведомость'];
		//Sheet.PageSetup.PrintTitleRows := '$1:$7';

		oraquery3.Close;
		oraquery3.SQL.text := SQL;
		oraquery3.Open;

		e := 8;
		INC_POS := 1;

		part1 := '';
		part2 := '';
		
		while not OraQuery3.EoF Do
		begin
			if ((part1 <> '') and (part2 <> '') and ((copy(part1, 1, 2) = '01') or (copy(part1, 1, 2) = '02') or
			(copy(part1, 1, 2) = '04')) and ((part1 <> OraQuery3.FieldByName('PART').AsString)
			or (part2 <> OraQuery3.FieldByName('PART2').AsString))) then
			begin
				Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 15]].borders.linestyle := xlContinuous;
				Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 9]].MergeCells := true;

				Sheet.Cells[e, 2].Font.Bold := True;
				Sheet.Cells[e, 2].NumberFormat := '@';
				Sheet.Cells[e, 2].Value := 'ИТОГО: ';
				Sheet.Cells[e, 2].HorizontalAlignment := xlLeft;
				Sheet.Cells[e, 2].VerticalAlignment := xlCenter;

				Sheet.Cells[e, 10].NumberFormat := '';
				Sheet.Cells[e, 10].Formula := '=SUM(J' + inttostr(temp_priz) + ':J' + inttostr((e - 1)) + ')';
				Sheet.Cells[e, 10].HorizontalAlignment := xlCenter;
				Sheet.Cells[e, 10].VerticalAlignment := xlCenter;

				Sheet.Cells[e, 11].NumberFormat := '';
				Sheet.Cells[e, 11].Formula := '=SUM(K' + inttostr(temp_priz) + ':K' + inttostr((e - 1)) + ')';
				Sheet.Cells[e, 11].HorizontalAlignment := xlCenter;
				Sheet.Cells[e, 11].VerticalAlignment := xlCenter;

				Sheet.Cells[e, 12].NumberFormat := '';
				Sheet.Cells[e, 12].Formula := '=SUM(L' + inttostr(temp_priz) + ':L' + inttostr((e - 1)) + ')';
				Sheet.Cells[e, 12].HorizontalAlignment := xlCenter;
				Sheet.Cells[e, 12].VerticalAlignment := xlCenter;

				Sheet.Cells[e, 13].NumberFormat := '';
				Sheet.Cells[e, 13].Formula := '=AVERAGE(M' + inttostr(temp_priz) + ':M' + inttostr((e - 1)) + ')';
				Sheet.Cells[e, 13].HorizontalAlignment := xlCenter;
				Sheet.Cells[e, 13].VerticalAlignment := xlCenter;

				Sheet.Cells[e, 15].NumberFormat := '';
				Sheet.Cells[e, 15].Formula := '=SUM(O' + inttostr(temp_priz) + ':O' + inttostr((e - 1)) + ')';
				Sheet.Cells[e, 15].HorizontalAlignment := xlCenter;
				Sheet.Cells[e, 15].VerticalAlignment := xlCenter;

				inc(e);
			end;

			if part1 <> OraQuery3.FieldByName('PART').AsString then
			begin
				Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 15]].borders.linestyle := xlContinuous;
				Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 14]].MergeCells := true;

				Sheet.Cells[e, 2].HorizontalAlignment := xlLeft;
				Sheet.Cells[e, 2].VerticalAlignment := xlCenter;
				Sheet.Cells[e, 2].WrapText := false;
				Sheet.Cells[e, 2].Font.Bold := True;
				Sheet.Cells[e, 2].NumberFormat:= '@';
				Sheet.Cells[e, 2].Value:=OraQuery3.FieldByName('PART').AsString;

				part1 := OraQuery3.FieldByName('PART').AsString;

				inc(e);
			end;

			if part2 <> OraQuery3.FieldByName('PART2').AsString then
			begin
				Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 15]].borders.linestyle := xlContinuous;
				Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 14]].MergeCells := true;

				Sheet.Cells[e, 2].HorizontalAlignment := xlLeft;
				Sheet.Cells[e, 2].VerticalAlignment := xlCenter;
				Sheet.Cells[e, 2].WrapText := false;
				Sheet.Cells[e, 2].Font.Bold := True;
				Sheet.Cells[e, 2].NumberFormat:= '@';
				Sheet.Cells[e, 2].Value:=OraQuery3.FieldByName('PART2').AsString;

				part2 := OraQuery3.FieldByName('PART2').AsString;

				inc(e);
				TEMP_PRIZ := e;
			end;
			
			Sheet.range[Sheet.cells[e, 1], Sheet.cells[e, 15]].borders.linestyle := xlContinuous;

			//pos
			Sheet.Cells[e, 1].Value := intToStr(INC_POS);
			Sheet.Cells[e, 1].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 1].VerticalAlignment := xlCenter;

			//name
			Sheet.Cells[e, 2].Value := OraQuery3.FieldByName('SUBGRP').AsString + ' ' + OraQuery3.FieldByName('GOST').AsString + ' ' + OraQuery3.FieldByName('GOST_TY').AsString + ' ' + OraQuery3.FieldByName('TYPE_RAZM').AsString;
			Sheet.Cells[e, 2].Font.Bold := false;
			Sheet.Cells[e, 2].WrapText := true;
			Sheet.Cells[e, 2].HorizontalAlignment := xlLeft;
			Sheet.Cells[e, 2].VerticalAlignment := xlCenter;

			//marka
			Sheet.Cells[e, 3].Value := OraQuery3.FieldByName('MARKA').AsString;
			Sheet.Cells[e, 3].WrapText := true;
			Sheet.Cells[e, 3].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 3].VerticalAlignment := xlCenter;

			//gost
			Sheet.Cells[e, 4].Value := OraQuery3.FieldByName('GOST_MAT').AsString;
			Sheet.Cells[e, 4].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 4].VerticalAlignment := xlCenter;

			//kod
			Sheet.Cells[e, 5].NumberFormat := '@';
			Sheet.Cells[e, 5] := OraQuery3.FieldByName('KOD').AsString;
			Sheet.Cells[e, 5].WrapText := true;
			Sheet.Cells[e, 5].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 5].VerticalAlignment := xlCenter;

			//ed izm osn
			Sheet.Cells[e, 6].Value := OraQuery3.FieldByName('ED').AsString;
			Sheet.Cells[e, 6].WrapText := true;
			Sheet.Cells[e, 6].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 6].VerticalAlignment := xlCenter;

			//kod ed izm osn
			Sheet.Cells[e, 7].NumberFormat:= '@';
			Sheet.Cells[e, 7].Value := OraQuery3.FieldByName('CED').AsString;
			Sheet.Cells[e, 7].WrapText := true;
			Sheet.Cells[e, 7].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 7].VerticalAlignment := xlCenter;

			//ed izm uchet
			Sheet.Cells[e, 8].Value := OraQuery3.FieldByName('ED_UCHET').AsString;
			Sheet.Cells[e, 8].WrapText := true;
			Sheet.Cells[e, 8].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 8].VerticalAlignment := xlCenter;

			//kod ed izm uchet
			Sheet.Cells[e, 9].NumberFormat:= '@';
			Sheet.Cells[e, 9].Value := OraQuery3.FieldByName('CED_UCHET').AsString;
			Sheet.Cells[e, 9].WrapText := true;
			Sheet.Cells[e, 9].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 9].VerticalAlignment := xlCenter;

			//norma v osn
			Sheet.Cells[e, 10].Value := excelFloat(OraQuery3.FieldbyName('POTR').asString);
			Sheet.Cells[e, 10].WrapText := true;
			Sheet.Cells[e, 10].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 10].VerticalAlignment := xlCenter;

			//norma v uchet
			Sheet.Cells[e, 11].Value := excelFloat(OraQuery3.FieldByName('POTR_UCHET').asString);
			Sheet.Cells[e, 11].WrapText := true;
			Sheet.Cells[e, 11].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 11].VerticalAlignment := xlCenter;

			//massa
			Sheet.Cells[e, 12].Value := excelFloat(OraQuery3.FieldByName('kof_isp').asString);
			Sheet.Cells[e, 12].WrapText := true;
			Sheet.Cells[e, 12].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 12].VerticalAlignment := xlCenter;

			//koeficient
			Sheet.Cells[e, 13].Value := excelFloat(OraQuery3.FieldByName('defkof').asString);
			Sheet.Cells[e, 13].WrapText := true;
			Sheet.Cells[e, 13].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 13].VerticalAlignment := xlCenter;

			//massa specificaciya
			Sheet.Cells[e, 15].Value := excelFloat(OraQuery3.FieldByName('MASS').asString);
			Sheet.Cells[e, 15].WrapText := true;
			Sheet.Cells[e, 15].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 15].VerticalAlignment := xlCenter;

			inc(e);
			inc(INC_POS);

			OraQuery3.Next;
		end;

		if ((copy(part1, 1, 2) = '01') or (copy(part1, 1, 2) = '02') or (copy(part1, 1, 2) = '04')) then
		begin
			Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 15]].borders.linestyle := xlContinuous;
			Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 9]].MergeCells := true;

			Sheet.Cells[e, 2].Font.Bold := True;
			Sheet.Cells[e, 2].NumberFormat := '@';
			Sheet.Cells[e, 2].Value := 'ИТОГО: ';
			Sheet.Cells[e, 2].HorizontalAlignment := xlLeft;
			Sheet.Cells[e, 2].VerticalAlignment := xlCenter;

			Sheet.Cells[e, 10].NumberFormat := '';
			Sheet.Cells[e, 10].Formula := '=SUM(J' + inttostr(temp_priz) + ':J' + inttostr((e - 1)) + ')';
			Sheet.Cells[e, 10].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 10].VerticalAlignment := xlCenter;

			Sheet.Cells[e, 11].NumberFormat := '';
			Sheet.Cells[e, 11].Formula := '=SUM(K' + inttostr(temp_priz) + ':K' + inttostr((e - 1)) + ')';
			Sheet.Cells[e, 11].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 11].VerticalAlignment := xlCenter;

			Sheet.Cells[e, 12].NumberFormat := '';
			Sheet.Cells[e, 12].Formula := '=SUM(L' + inttostr(temp_priz) + ':L' + inttostr((e - 1)) + ')';
			Sheet.Cells[e, 12].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 12].VerticalAlignment := xlCenter;

			Sheet.Cells[e, 13].NumberFormat := '';
			Sheet.Cells[e, 13].Formula := '=SUM(M' + inttostr(temp_priz) + ':M' + inttostr((e - 1)) + ')';
			Sheet.Cells[e, 13].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 13].VerticalAlignment := xlCenter;

			Sheet.Cells[e, 14].NumberFormat := '';
			Sheet.Cells[e, 14].Formula := '=AVERAGE(N' + inttostr(temp_priz) + ':N' + inttostr((e - 1)) + ')';
			Sheet.Cells[e, 14].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 14].VerticalAlignment := xlCenter;

			inc(e);
		end;

		FExcel.Visible := true;
	end
	else
	begin

		FExcel:=CreateOleObject('Excel.Application');
		FExcel.EnableEvents := False;
		FExcel.Visible:=false;
		FExcel.Workbooks.Add(-4167);
		FExcel.Workbooks[1].WorkSheets[1].Name:='Ведомость';
		Colum:=FExcel.Workbooks[1].WorkSheets['Ведомость'].Columns;

		Colum.Columns[1].ColumnWidth:=1;
		Colum.Columns[2].ColumnWidth:=6;
		Colum.Columns[3].ColumnWidth:=60;
		Colum.Columns[4].ColumnWidth:=15;
		Colum.Columns[5].ColumnWidth:=15;
		Colum.Columns[6].ColumnWidth:=10;
		Colum.Columns[7].ColumnWidth:=10;
		Colum.Columns[8].ColumnWidth:=30;
		Colum.Columns[9].ColumnWidth:=20;
		Colum.Columns[10].ColumnWidth:=20;
		Colum.Columns[11].ColumnWidth:=10;
		Colum.Columns[12].ColumnWidth:=10;
		Colum.Columns[13].ColumnWidth:=10;
		Colum.Columns[14].ColumnWidth:=10;
		Colum.Columns[15].ColumnWidth:=10;
		Colum.Columns[16].ColumnWidth:=10;

		Sheet:=FExcel.Workbooks[1].WorkSheets['Ведомость'];
		Sheet.Cells[1,1]:='                             Отчет  норма материалов по '+oraQuery1.FieldByName('name').asString+' '+zak+' на '+DateToStr(now);
		Sheet.Cells[1,1].Font.Bold := True;
		Sheet.Cells[1,1].Font.Size := Sheet.Cells[1,2].Font.Size+5;
		//Sheet.Cells[2,1]:='Раздел';
		Sheet.Cells[2,1].Font.Bold := True;
		Sheet.Cells[2,1].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,2]:='Код группы';
		Sheet.Cells[2,2].Font.Bold := True;
		Sheet.Cells[2,2].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,3]:='Подгруппа';
		Sheet.Cells[2,3].Font.Bold := True;
		Sheet.Cells[2,3].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,4]:='Код материала ';
		Sheet.Cells[2,4].Font.Bold := True;
		Sheet.Cells[2,4].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,5]:='ГОСТ на тех.требования';
		Sheet.Cells[2,5].Font.Bold := True;
		Sheet.Cells[2,5].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,6]:='Марка';
		Sheet.Cells[2,6].Font.Bold := True;
		Sheet.Cells[2,6].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,7]:='Типоразмер';
		Sheet.Cells[2,7].Font.Bold := True;
		Sheet.Cells[2,7].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,8]:='Наименование дополнительное';
		Sheet.Cells[2,8].Font.Bold := True;
		Sheet.Cells[2,8].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,9]:='ГОСТ на марку ';
		Sheet.Cells[2,9].Font.Bold := True;
		Sheet.Cells[2,9].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,10]:='ГОСТ на сортамент ';
		Sheet.Cells[2,10].Font.Bold := True;
		Sheet.Cells[2,10].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,11]:='Основная единица ';
		Sheet.Cells[2,11].Font.Bold := True;
		Sheet.Cells[2,11].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,12]:='Норма в основной единице ';
		Sheet.Cells[2,12].Font.Bold := True;
		Sheet.Cells[2,12].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,13]:='Неосновная единица ';
		Sheet.Cells[2,13].Font.Bold := True;
		Sheet.Cells[2,13].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,14]:='Норма в неосновной единице ';
		Sheet.Cells[2,14].Font.Bold := True;
		Sheet.Cells[2,14].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,15]:='Масса по спецификации ';
		Sheet.Cells[2,15].Font.Bold := True;
		Sheet.Cells[2,15].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,16]:='Масса';
		Sheet.Cells[2,16].Font.Bold := True;
		Sheet.Cells[2,16].Font.Size := Sheet.Cells[1,1].Font.Size-3;

		Sheet.range[Sheet.cells[2,2],Sheet.cells[2,16]].borders.weight:=3;

		OraQuery3.SQL.Text:=tx;
		OraQuery3.ExecSQL; OraQuery3.First;

		e:=1;
		part1:='';
		part2:='';

		While NOT OraQuery3.EOF Do
		Begin

			if part1<>OraQuery3.FieldByName('PART').AsString then
			begin
				Sheet.Cells[e+2,3].Font.Bold := True;
				Sheet.Cells[e+2,3].Font.Size := Sheet.Cells[1,1].Font.Size-2;
				Sheet.Cells[e+2,3].NumberFormat:= '@';
				Sheet.Cells[e+2,3]:=OraQuery3.FieldByName('PART').AsString;
				part1:=OraQuery3.FieldByName('PART').AsString;
				e:=e+1;
			end;

			if part2<>OraQuery3.FieldByName('PART2').AsString then
			begin
				Sheet.Cells[e+2,3].Font.Bold := True;
				Sheet.Cells[e+2,3].Font.Size := Sheet.Cells[1,1].Font.Size-4;
				Sheet.Cells[e+2,3].NumberFormat:= '@';
				Sheet.Cells[e+2,3]:=OraQuery3.FieldByName('PART2').AsString;
				part2:=OraQuery3.FieldByName('PART2').AsString;
				e:=e+1;
			end;

			//  Sheet.range[Sheet.cells[e+2,1],Sheet.cells[e+2,15]].NumberFormat:= '@';
			//  Sheet.Cells[e+2,1]:=OraQuery3.FieldByName('PART').AsString;

			Sheet.Cells[e+2,2].NumberFormat:= '@';
			Sheet.Cells[e+2,2]:=OraQuery3.FieldByName('GRP_KOD').AsString;

			Sheet.Cells[e+2,3].NumberFormat:= '@';
			Sheet.Cells[e+2,3]:=OraQuery3.FieldByName('SUBGRP').AsString;
			Sheet.Cells[e+2,4].NumberFormat:= '@';
			Sheet.Cells[e+2,4]:=OraQuery3.FieldByName('KOD').AsString;

			Sheet.Cells[e+2,5].NumberFormat:= '@';
			Sheet.Cells[e+2,5]:=OraQuery3.FieldByName('GOST').AsString;

			Sheet.Cells[e+2,6].NumberFormat:= '@';
			Sheet.Cells[e+2,6]:=OraQuery3.FieldByName('MARKA').AsString;

			Sheet.Cells[e+2,7].NumberFormat:= '@';
			Sheet.Cells[e+2,7]:=OraQuery3.FieldByName('TYPE_RAZM').AsString;

			Sheet.Cells[e+2,8].NumberFormat:= '@';
			Sheet.Cells[e+2,8]:=OraQuery3.FieldByName('DOP_NAME').AsString;

			Sheet.Cells[e+2,9].NumberFormat:= '@';
			Sheet.Cells[e+2,9]:=OraQuery3.FieldByName('GOST_TY').AsString;

			Sheet.Cells[e+2,10].NumberFormat:= '@';
			Sheet.Cells[e+2,10]:=OraQuery3.FieldByName('GOST_MAT').AsString;

			Sheet.Cells[e+2,11].NumberFormat:= '@';
			Sheet.Cells[e+2,11]:=OraQuery3.FieldByName('ED').AsString;

			//    Sheet.Cells[e+2,11].NumberFormat:= '@';;

			Sheet.Cells[e+2,12].NumberFormat:=AnsiChar('@');
			Sheet.Cells[e+2,12]:=StringReplace(OraQuery3.FieldByName('POTR').AsString,'.',',', [rfReplaceAll, rfIgnoreCase]);
			//    ShowMEssage(OraQuery3.FieldByName('POTR').AsString);

			Sheet.Cells[e+2,13].NumberFormat:= '@';
			Sheet.Cells[e+2,13]:=OraQuery3.FieldByName('ED_UCHET').AsString;
			//    Sheet.Cells[e+2,12].NumberFormat:=AnsiChar('@');
			// Sheet.Cells[e+2,13].NumberFormat:= '@';

			Sheet.Cells[e+2,14].NumberFormat:=AnsiChar('@');
			Sheet.Cells[e+2,14]:=StringReplace(OraQuery3.FieldByName('POTR_UCHET').AsString,'.',',', [rfReplaceAll, rfIgnoreCase]);


			Sheet.Cells[e+2,15].NumberFormat:='@';
			Sheet.Cells[e+2,15]:=StringReplace(OraQuery3.FieldByName('MASS').AsString,'.',',', [rfReplaceAll, rfIgnoreCase]);
			Sheet.Cells[e+2,16].NumberFormat:= '@';
			Sheet.Cells[e+2,16]:=OraQuery3.FieldByName('kof_isp').AsString;

			OraQuery3.Next;
			e:=e+1;
		end;

		FExcel.Visible:=true;
	end;

end;

     if form9.caption='Наряды по цеху,проекту' then
begin
  Application.CreateForm(TFNaryd_Cex_Proekt, FNaryd_Cex_Proekt);
  FNaryd_Cex_Proekt.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FNaryd_Cex_Proekt.EDIT2.TEXT:=EDIT1.Text;
  FNaryd_Cex_Proekt.Caption:='Наряды: '+oraQuery1.FieldByName('name').asString;
  if EDIT1.Text <> 'All' then
  FNaryd_Cex_Proekt.Caption:=FNaryd_Cex_Proekt.Caption+'  ЦЕХ='+Form32.oraQuery1.FieldByName('nomer').asString
  else
  FNaryd_Cex_Proekt.Caption:=FNaryd_Cex_Proekt.Caption+'  по всем цехам';
  FNaryd_Cex_Proekt.ShowModal();
  FNaryd_Cex_Proekt.Free;
end;

     if form9.caption='Остатки трудоёмкости по ПУЕ(без МСЧ). Выберите проект' then
begin
  Application.CreateForm(TFOstatok_Trud_PUE_No_MSCH, FOstatok_Trud_PUE_No_MSCH);
  FOstatok_Trud_PUE_No_MSCH.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FOstatok_Trud_PUE_No_MSCH.EDIT2.TEXT:=EDIT1.Text;
  FOstatok_Trud_PUE_No_MSCH.EDIT3.TEXT:=oraQuery1.FieldByName('name').asString;
  FOstatok_Trud_PUE_No_MSCH.Caption:='Остатки трудоёмкости по ПУЕ(без МСЧ): '+oraQuery1.FieldByName('name').asString;
  FOstatok_Trud_PUE_No_MSCH.ShowModal();
  FOstatok_Trud_PUE_No_MSCH.Free;
end;

     if form9.caption='Остатки трудоёмкости по МСЧ. Выберите проект' then
begin
  Application.CreateForm(TFOstatki_Trud_Msch, FOstatki_Trud_Msch);
  FOstatki_Trud_Msch.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FOstatki_Trud_Msch.Caption:='Остатки трудоёмкости по МСЧ: '+oraQuery1.FieldByName('name').asString;
  FOstatki_Trud_Msch.ShowModal();
  FOstatki_Trud_Msch.Free;
end;

     if form9.caption='Наряды с привязкой к УКР с начала постройки по проекту. Выберите проект' then
begin
  Application.CreateForm(TFNaryd_UKR_Pue, FNaryd_UKR_Pue);
  FNaryd_UKR_Pue.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FNaryd_UKR_Pue.Caption:='Наряды с привязкой к УКР с начала постройки по проекту: '+oraQuery1.FieldByName('name').asString;
  FNaryd_UKR_Pue.ShowModal();
  FNaryd_UKR_Pue.Free;
end;

     if form9.caption='Нормированная тр-ть по цеху в разрезе профессий,разрядов,тарифных сеток по проекту. Выберите проект' then
begin
  Application.CreateForm(TFNorm_Trud_Prof_Razr_Setka, FNorm_Trud_Prof_Razr_Setka);
  FNorm_Trud_Prof_Razr_Setka.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FNorm_Trud_Prof_Razr_Setka.EDIT2.TEXT:=EDIT1.Text;
  FNorm_Trud_Prof_Razr_Setka.Caption:='Нормированная тр-ть по цеху в разрезе профессий,разрядов,тарифных сеток: '+oraQuery1.FieldByName('name').asString;
  FNorm_Trud_Prof_Razr_Setka.Caption:=FNorm_Trud_Prof_Razr_Setka.Caption+'  ЦЕХ='+Form32.oraQuery1.FieldByName('nomer').asString;
  FNorm_Trud_Prof_Razr_Setka.ShowModal();
  FNorm_Trud_Prof_Razr_Setka.Free;
end;

     if  form9.Caption='Суммарная нормированная тр-ть по цеху в разрезе разрядов,тарифных сеток,профессий c привязкой к УКР по проекту. Выберите проект' then
begin
  Application.CreateForm(TFSum_Norm_Trud_Razr_Setka_Prof_Ukr, FSum_Norm_Trud_Razr_Setka_Prof_Ukr);
  FSum_Norm_Trud_Razr_Setka_Prof_Ukr.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FSum_Norm_Trud_Razr_Setka_Prof_Ukr.EDIT2.TEXT:=EDIT1.Text;
  FSum_Norm_Trud_Razr_Setka_Prof_Ukr.Caption:='Суммарная нормированная тр-ть в разрезе разрядов,тарифных сеток,профессий c привязкой к УКР: '+oraQuery1.FieldByName('name').asString;
  FSum_Norm_Trud_Razr_Setka_Prof_Ukr.Caption:=FSum_Norm_Trud_Razr_Setka_Prof_Ukr.Caption+'  ЦЕХ='+Form32.oraQuery1.FieldByName('nomer').asString;
  FSum_Norm_Trud_Razr_Setka_Prof_Ukr.ShowModal();
  FSum_Norm_Trud_Razr_Setka_Prof_Ukr.Free;
end;

     if  form9.Caption='Незакрытые ПУЕ(без МСЧ) по цеху по проекту. Выберите проект' then
begin
  Application.CreateForm(TFNo_Close_Pue_Cex_Proekt, FNo_Close_Pue_Cex_Proekt);
  FNo_Close_Pue_Cex_Proekt.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FNo_Close_Pue_Cex_Proekt.EDIT2.TEXT:=EDIT1.Text;
  FNo_Close_Pue_Cex_Proekt.Caption:='Незакрытые ПУЕ(без МСЧ) по цеху по проекту: '+oraQuery1.FieldByName('name').asString;
  FNo_Close_Pue_Cex_Proekt.Caption:=FNo_Close_Pue_Cex_Proekt.Caption+'  ЦЕХ='+Form32.oraQuery1.FieldByName('nomer').asString;
  FNo_Close_Pue_Cex_Proekt.ShowModal();
  FNo_Close_Pue_Cex_Proekt.Free;
end;


     if form9.caption='Количество покупных изделий с привязкой к ТН,позиции СП по проекту. Выберите проект' then
begin
  Application.CreateForm(TFKol_All_Pokup_Izd_Proekt, FKol_All_Pokup_Izd_Proekt);
  FKol_All_Pokup_Izd_Proekt.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FKol_All_Pokup_Izd_Proekt.Caption:='Количество покупных изделий с привязкой к ТН,позиции СП по проекту: '+oraQuery1.FieldByName('name').asString;
  FKol_All_Pokup_Izd_Proekt.ShowModal();
  FKol_All_Pokup_Izd_Proekt.Free;
end;

     if form9.caption='Отёт по привязке ПУЕ к УДП по проекту. Выберите проект' then
begin
  Application.CreateForm(TFPue_Udp_Report, FPue_Udp_Report);
  FPue_Udp_Report.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FPue_Udp_Report.Caption:='Отёт по привязке ПУЕ к УДП по проекту: '+oraQuery1.FieldByName('name').asString;
  FPue_Udp_Report.ShowModal();
  FPue_Udp_Report.Free;
end;

     if form9.caption='Укрупнённые помещения по проекту: СП,ПУЕ,УДП' then
begin
  Application.CreateForm(TFUkr_Pom_SP_Tk, FUkr_Pom_SP_Tk);
  FUkr_Pom_SP_Tk.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FUkr_Pom_SP_Tk.Caption:='Укрупнённые помещения по проекту для ПР34: '+oraQuery1.FieldByName('name').asString;
  FUkr_Pom_SP_Tk.ShowModal();
  FUkr_Pom_SP_Tk.Free;
end;

     if form9.caption='Укрупнённые помещения по ТНВ по извещениям по проекту' then
begin
  Application.CreateForm(TFUkr_Pom_TNV_IZV, FUkr_Pom_TNV_IZV);
  FUkr_Pom_TNV_IZV.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FUkr_Pom_TNV_IZV.Caption:='Укрупнённые помещения по ТНВ по извещениям по проекту: '+oraQuery1.FieldByName('name').asString;
  FUkr_Pom_TNV_IZV.ShowModal();
  FUkr_Pom_TNV_IZV.Free;
end;

      if form9.caption='Применяемость ПУЕ: Документы движения,Наряды по проекту. Выберите проект' then
begin
  Application.CreateForm(TFPrimen_PUE_in_dok_dvig_naryd, FPrimen_PUE_in_dok_dvig_naryd);
  FPrimen_PUE_in_dok_dvig_naryd.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FPrimen_PUE_in_dok_dvig_naryd.Edit2.Text:=oraQuery1.FieldByName('name').asString;
  FPrimen_PUE_in_dok_dvig_naryd.Caption:='ТК/ТН по проекту: '+oraQuery1.FieldByName('name').asString;
  FPrimen_PUE_in_dok_dvig_naryd.ShowModal();
  FPrimen_PUE_in_dok_dvig_naryd.Free;
end;

     if form9.caption='Расход по годам в разрезе затребованных и отгруженных материалов по проекту. Выберите проект' then
begin
  Application.CreateForm(TFRasxod_proekt_years_zatr_otgr_mt, FRasxod_proekt_years_zatr_otgr_mt);
  FRasxod_proekt_years_zatr_otgr_mt.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FRasxod_proekt_years_zatr_otgr_mt.Edit2.Text:=oraQuery1.FieldByName('name').asString;
  FRasxod_proekt_years_zatr_otgr_mt.Caption:='Расход по годам в разрезе затребованных и отгруженных материалов по проекту: '+oraQuery1.FieldByName('name').asString;
  FRasxod_proekt_years_zatr_otgr_mt.ShowModal();
  FRasxod_proekt_years_zatr_otgr_mt.Free;
end;


     if form9.caption='Расход по годам в разрезе затребованного и отгруженного оборудования по проекту. Выберите проект' then
begin
  Application.CreateForm(TFRasxod_proekt_years_zatr_otgr_ob, FRasxod_proekt_years_zatr_otgr_ob);
  FRasxod_proekt_years_zatr_otgr_ob.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FRasxod_proekt_years_zatr_otgr_ob.Edit2.Text:=oraQuery1.FieldByName('name').asString;
  FRasxod_proekt_years_zatr_otgr_ob.Caption:='Расход по годам в разрезе затребованного и отгруженного оборудования  по проекту: '+oraQuery1.FieldByName('name').asString;
  FRasxod_proekt_years_zatr_otgr_ob.ShowModal();
  FRasxod_proekt_years_zatr_otgr_ob.Free;
end;

     if form9.caption='Расход по годам в разрезе затребованной номенклатуры по проекту. Выберите проект' then
begin
  Application.CreateForm(TFRasxod_proekt_years_zatr, FRasxod_proekt_years_zatr);
  FRasxod_proekt_years_zatr.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FRasxod_proekt_years_zatr.Caption:='Расход по годам в разрезе затребованной номенклатуры по проекту: '+oraQuery1.FieldByName('name').asString;
  FRasxod_proekt_years_zatr.ShowModal();
  FRasxod_proekt_years_zatr.Free;
end;

   if form9.caption='Приходные ордера по отгруженному оборудованию по проекту. Выберите проект' then
begin
  Application.CreateForm(TFRasxod_obor_otgr_prixod_order, FRasxod_obor_otgr_prixod_order);
  FRasxod_obor_otgr_prixod_order.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FRasxod_obor_otgr_prixod_order.Caption:='Приходные ордера по отгруженному оборудованию по проекту: '+oraQuery1.FieldByName('name').asString;
  FRasxod_obor_otgr_prixod_order.ShowModal();
  FRasxod_obor_otgr_prixod_order.Free;
end;

   if form9.caption='Приходные ордера по отгруженным материалам по проекту. Выберите проект' then
begin
  Application.CreateForm(TFRasxod_mater_otgr_prixod_order, FRasxod_mater_otgr_prixod_order);
  FRasxod_mater_otgr_prixod_order.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FRasxod_mater_otgr_prixod_order.Caption:='Приходные ордера по отгруженным материалам по проекту: '+oraQuery1.FieldByName('name').asString;
  FRasxod_mater_otgr_prixod_order.ShowModal();
  FRasxod_mater_otgr_prixod_order.Free;
end;

     if form9.caption='Ведомости снабжения,заказные с привязкой к веткам по проекту. Выберите проект' then
begin

  Application.CreateForm(TFVedom_snab_vetka_cfek, FVedom_snab_vetka_cfek);
  FVedom_snab_vetka_cfek.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FVedom_snab_vetka_cfek.Caption:='Ведомости снабжения,заказные с привязкой к веткам по проекту: '+oraQuery1.FieldByName('name').asString;
  FVedom_snab_vetka_cfek.ShowModal();
  FVedom_snab_vetka_cfek.Free;

end;

      if form9.caption='УДП по проекту: тр-ть норма,факт,остаток,процент выработки. Выберите проект' then
begin
  Application.CreateForm(TFUdp_Norma_Fakt_Ostatok, FUdp_Norma_Fakt_Ostatok);
  FUdp_Norma_Fakt_Ostatok.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FUdp_Norma_Fakt_Ostatok.Edit2.Text:=oraQuery1.FieldByName('zavn').asString;
  FUdp_Norma_Fakt_Ostatok.Caption:='УДП по проекту: '+oraQuery1.FieldByName('name').asString;
  FUdp_Norma_Fakt_Ostatok.ShowModal();
  FUdp_Norma_Fakt_Ostatok.Free;
end;

      if form9.caption='ОТК: УДП по проекту. Выберите проект' then
begin
  Application.CreateForm(TFUDP_OTK, FUDP_OTK);
  FUDP_OTK.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FUDP_OTK.Edit2.Text:=oraQuery1.FieldByName('zavn').asString;
  FUDP_OTK.Caption:='УДП по проекту: '+oraQuery1.FieldByName('name').asString;
  FUDP_OTK.ShowModal();
  FUDP_OTK.Free;
end;

       if form9.caption='УДП: Незакрытые ТК-ПТК в закрытых УДП по проекту. Выберите проект' then
begin
  Application.CreateForm(TFNEZAKR_TK_PTK_UDP_ZAKR, FNEZAKR_TK_PTK_UDP_ZAKR);
  FNEZAKR_TK_PTK_UDP_ZAKR.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FNEZAKR_TK_PTK_UDP_ZAKR.Edit2.Text:=oraQuery1.FieldByName('zavn').asString;
  FNEZAKR_TK_PTK_UDP_ZAKR.Caption:='Незакрытые ТК-ПТК в закрытых УДП по проекту: '+oraQuery1.FieldByName('name').asString;
  FNEZAKR_TK_PTK_UDP_ZAKR.ShowModal();
  FNEZAKR_TK_PTK_UDP_ZAKR.Free;
end;

       if form9.caption='УДП: Заказчик. Выберите проект' then
begin
  Application.CreateForm(TFUdp_Zakazchik, FUdp_Zakazchik);
  FUdp_Zakazchik.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FUdp_Zakazchik.Edit2.Text:=oraQuery1.FieldByName('zavn').asString;
  FUdp_Zakazchik.Edit3.Text:=oraQuery1.FieldByName('proekt').asString;
  FUdp_Zakazchik.Caption:='УДП Заказчика по проекту: '+oraQuery1.FieldByName('name').asString;
  FUdp_Zakazchik.ShowModal();
  FUdp_Zakazchik.Free;
end;

       if form9.caption='ПДО: Отчёт по УДП по проекту. Выберите проект' then
begin
  Application.CreateForm(TFUdp_PDO_Report, FUdp_PDO_Report);
  FUdp_PDO_Report.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FUdp_PDO_Report.Edit2.Text:=oraQuery1.FieldByName('zavn').asString;
  FUdp_PDO_Report.Caption:='Отчёт по УДП по проекту: '+oraQuery1.FieldByName('name').asString;
  FUdp_PDO_Report.ShowModal();
  FUdp_PDO_Report.Free;
end;

      if form9.caption='ПУЕ с трудоёмкостью 0 с привязкой к УДП по проекту. Выберите проект' then
begin
  Application.CreateForm(TFUdp_Pue_Norma_Zero, FUdp_Pue_Norma_Zero);
  FUdp_Pue_Norma_Zero.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FUdp_Pue_Norma_Zero.Caption:='Проект: '+Form9.oraQuery1.FieldByName('name').asString;
  FUdp_Pue_Norma_Zero.Caption:=FUdp_Pue_Norma_Zero.Caption+'  ПУЕ с трудоёмкостью 0';
  FUdp_Pue_Norma_Zero.ShowModal();
  FUdp_Pue_Norma_Zero.Free;
end;


    if form9.caption='Количество изделий МСЧ по проекту. Выберите проект' then
begin
  Application.CreateForm(TFKol_Izd_Msch_Proekt, FKol_Izd_Msch_Proekt);
  FKol_Izd_Msch_Proekt.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FKol_Izd_Msch_Proekt.Caption:='Количество изделий МСЧ по проекту: '+oraQuery1.FieldByName('name').asString;
  FKol_Izd_Msch_Proekt.ShowModal();
  FKol_Izd_Msch_Proekt.Free;
end;

    if form9.caption='Запас МСЧ на ЦКС по ячейкам. Выберите проект' then
begin
  Application.CreateForm(TFReserve_Msch_Cks_Place, FReserve_Msch_Cks_Place);
  FReserve_Msch_Cks_Place.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FReserve_Msch_Cks_Place.Caption:='Запас МСЧ на ЦКС по ячейкам по проекту: '+oraQuery1.FieldByName('name').asString;
  FReserve_Msch_Cks_Place.ShowModal();
  FReserve_Msch_Cks_Place.Free;
end;

    if form9.caption='Оборудование из комплектной поставки для склада ЗИП по проекту. Выберите проект' then
begin
  Application.CreateForm(TFEquipment_For_Sklad_ZIP, FEquipment_For_Sklad_ZIP);
  FEquipment_For_Sklad_ZIP.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FEquipment_For_Sklad_ZIP.Caption:='Оборудование из комплектной поставки для склада ЗИП по проекту. Выберите проект: '+oraQuery1.FieldByName('name').asString;
  FEquipment_For_Sklad_ZIP.ShowModal();
  FEquipment_For_Sklad_ZIP.Free;
end;

    if form9.caption='Ведомости снабжения,заказные по проекту. Выберите проект' then
begin
  Application.CreateForm(TFSP_Snab_Zakazn, FSP_Snab_Zakazn);
  FSP_Snab_Zakazn.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FSP_Snab_Zakazn.Caption:='Ведомости снабжения,заказные по проекту: '+oraQuery1.FieldByName('name').asString;
  FSP_Snab_Zakazn.ShowModal();
  FSP_Snab_Zakazn.Free;
end;

    if form9.caption='Оборудование по проекту. Выберите проект' then
begin
  Application.CreateForm(TFEquipment, FEquipment);
  FEquipment.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FEquipment.Caption:='Оборудование по проекту: '+oraQuery1.FieldByName('name').asString;
  FEquipment.ShowModal();
  FEquipment.Free;
end;

    if form9.caption='Перечень закрытой оснастки по проекту. Выберите проект' then
begin
  Application.CreateForm(TFSpisokCloseOsnastki, FSpisokCloseOsnastki);
  FSpisokCloseOsnastki.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FSpisokCloseOsnastki.Caption:='Перечень закрытой оснастки по проекту: '+oraQuery1.FieldByName('name').asString;
  FSpisokCloseOsnastki.ShowModal();
  FSpisokCloseOsnastki.Free;
end;

if form9.caption='Формирование ведомости комплектации запуска.' then
begin
 Form43.Label2.Caption:=oraQuery1.FieldByName('project_id').asString;
  Form43.Caption:='Формирование ведомости комплектации запуска.';
  Close();
  Form43.ShowModal();

end;

if form9.caption='Выберите проект для анализа' then
begin
 Form34.Label4.Caption:=oraQuery1.FieldByName('project_id').asString;
 Form34.Edit2.Text:=oraQuery1.FieldByName('name').asString;
  Close();

end;


if form9.caption='Отчет по заявкам' then
begin
  Form20.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form20.Caption:='Отчет по заявкам';
  Form20.ShowModal();

end;

if form9.caption='Отчет планируемой трудоемкости' then
begin
  Form21.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form21.Caption:='Отчет планируемой трудоемкости';
  Form21.ShowModal();

end;

if form9.caption='Отчет по выполнению ведомостей (Для склада ЗИП)' then
begin
  Application.CreateForm(TForm22, Form22);
  Form22.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form22.Caption:='Отчет по выполнению ведомостей (Для склада) c Приходами!   '+oraQuery1.FieldByName('name').asString;
  Form22.ShowModal();
  Form22.Free;
end;

  if form9.caption='Отчет по Отчет по ТН (материал изделие)' then
begin
  Form25.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form25.Caption:='Отчет по Отчет по ТН (материал изделие)';
  Form25.ShowModal();

end;


  if form9.caption='Ведомость материалов' then
begin
  Form26.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form26.Caption:='Ведомость материалов(без крепежа)';
  Form26.ShowModal();

end;

    if form9.caption='Потребность по материалам в разрезе чертежа' then
begin
  Form27.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form27.Caption:='Потребность в разрезе чертежа';
  Form27.EDIT2.TEXT:=EDIT1.Text;
  Form27.ShowModal();

end;

    if form9.caption='Отчет по поиску позиций с приоритетом 0 по проекту' then
begin
  Form35.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form35.Caption:='Отчет по поиску позиций с приоритетом 0 по проекту';
  Form35.ShowModal();

end;

    if form9.caption='Построечный журнал' then
begin
  Form36.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form36.Caption:='Построечный журнал по '+oraQuery1.FieldByName('zavn').asString;
  Form36.ShowModal();
end;

    if form9.caption='Ведомость комплектации по помещениям.' then
begin
Form10.Caption:='Ведомость комплектации по помещениям '+OraQuery1.FieldByName('name').AsString;;
 //ShowMessage(oraQuery1.FieldByName('project_id').asString);
 Form10.Label3.Caption:=oraQuery1.FieldByName('project_id').asString;
 Form10.ShowModal();

end;

    if form9.caption='Изделия с незаполненой трудоемкостью ТНа' then
begin
Form46.Caption:='Изделия с незаполненой трудоемкостью ТНа. По '+OraQuery1.FieldByName('name').AsString;;
Form46.Label1.Caption:=oraQuery1.FieldByName('project_id').asString;
Form46.Label2.Caption:='По '+oraQuery1.FieldByName('zavn').asString;
 Form46.ShowModal();

end;

if (form9.caption='Проверка документов на согласовании к справочнику.')   then
begin
 Form9.Close();
 Form38.Caption:='Проверка документов на согласовании к справочнику по '+OraQuery1.FieldByName('name').AsString;

 // Старая версия отчета по документам согласования ///
tx:=' Select doc.NUM_SPEC doc, posiz poz,obozn,name,kol_vo,kod_ed,kod_vedomstva , id_sprav, id_l, '' МСЧ не проставлен в справочнике '' pr from tronix.vimpel_, ';
tx:=tx+' (Select ID_SPEC, NUM_SPEC, name_spec from  tronix.spec where id_project='+oraQuery1.FieldByName('project_id').asString+'  and soglasovano is null) doc ';
tx:=tx+' where id_doc= doc.id_spec  ';
tx:=tx+' and SUBSTR(kod_vedomstva, 1, 1)=''3'' ';
tx:=tx+' and (Select can_do_self from tronix.sprav where sprav_id= id_sprav)<>1 ';
tx:=tx+' union all ';
tx:=tx+' Select doc.NUM_SPEC doc, posiz poz,obozn,name,kol_vo,kod_ed,kod_vedomstva , id_sprav, id_l, '' МСЧ  в справочнике код не 3'' pr from tronix.vimpel_, ';
tx:=tx+' (Select ID_SPEC, NUM_SPEC, name_spec from  tronix.spec where id_project='+oraQuery1.FieldByName('project_id').asString+'  and soglasovano is null) doc ';
tx:=tx+' where id_doc= doc.id_spec ';
tx:=tx+' and SUBSTR(kod_vedomstva, 1, 1)<>''3'' ';
tx:=tx+' and (Select can_do_self from tronix.sprav where sprav_id= id_sprav)=1 ';
tx:=tx+' union all ';
tx:=tx+' Select doc.NUM_SPEC doc, posiz poz,obozn,name,kol_vo,kod_ed,kod_vedomstva , id_sprav, id_l, '' Нет позиции в справочнике'' pr from tronix.vimpel_, ';
tx:=tx+' (Select ID_SPEC, NUM_SPEC, name_spec from  tronix.spec where id_project='+oraQuery1.FieldByName('project_id').asString+' and soglasovano is null) doc ';
tx:=tx+' where id_doc= doc.id_spec ';
tx:=tx+' and id_sprav is null ';

/// Новая версия отчета по SP
tx:=' Select do.ident doc,poz||'' ''||podpoz poz, sp.obozn, sp.name, sp.kol kol_vo, sp.kode kod_ed, sp.vz kod_vedomstva, id_sprav, '' МСЧ не проставлен в справочнике '' pr ';
tx:=tx+' from tronix.sp sp, tronix.document do ';
tx:=tx+' where sp.nnn=do.document_id ';
tx:=tx+' and do.id_project='+oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and SUBSTR(sp.vz, 1, 1)=''3'' ';
tx:=tx+' and (Select can_do_self from tronix.sprav where sprav_id= sp.id_sprav)<>1 ';
tx:=tx+' union all ';
tx:=tx+' Select do.ident doc,poz||'' ''||podpoz poz, sp.obozn, sp.name, sp.kol kol_vo, sp.kode kod_ed, sp.vz kod_vedomstva, id_sprav,'' МСЧ  в справочнике код не 3'' pr ';
tx:=tx+' from tronix.sp sp, tronix.document do ';
tx:=tx+' where sp.nnn=do.document_id ';
tx:=tx+' and do.id_project='+oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and SUBSTR(sp.vz, 1, 1)<>''3'' ';
tx:=tx+' and (Select can_do_self from tronix.sprav where sprav_id= sp.id_sprav)=1 ';
tx:=tx+' union all ';
///*/*** для Аксаны
tx:=tx+'Select  do.ident,sp.poz||'' ''||sp.podpoz poz, sp.obozn, sp.name, sp.kol kol_vo, sp.kode kod_ed, sp.vz kod_vedomstva, id_sprav, '' НеТъ Код Ведомости '' pr ';
tx:=tx+' from  tronix.sp sp, tronix.document do ';
tx:=tx+' where ';
tx:=tx+' do.id_project='+oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and sp.nnn=do.document_id ';
tx:=tx+' and type_str<>1 ';
tx:=tx+' and  VZ is null ';
tx:=tx+' union all ';
///******************
tx:=tx+' Select do.ident doc,poz||'' ''||podpoz poz, sp.obozn, sp.name, sp.kol kol_vo, sp.kode kod_ed, sp.vz kod_vedomstva, id_sprav,'' Нет позиции в справочнике'' pr ';
tx:=tx+' from tronix.sp sp, tronix.document do ';
tx:=tx+' where sp.nnn=do.document_id ';
tx:=tx+' and do.id_project='+oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and sp.vz is not null ';
tx:=tx+' and sp.id_sprav is null ';

Form38.OraQuery1.SQL.Text:=tx;

// Form38.Label3.Caption:=+oraQuery1.FieldByName('project_id').asString;
 Form38.ShowModal();
end;
 if (form9.caption='Потребность по материалам и оборудованию общая по проекту')   then
begin
 Form9.Close();
 Form38.Caption:='Потребность по материалам и оборудованию общая по проекту '+OraQuery1.FieldByName('name').AsString;
tx:='  Select psprav,(Select kod from tronix.sprav where sprav_id=psprav) kod,';
//tx:=tx+' (Select name from tronix.sprav where sprav_id= psprav) name,';
tx:=tx+' (Select name from tronix.sprav where sprav_id= psprav)||'' ''||(Select name from tronix.tip_lov where tip_lov_id=(Select tip_lov_tip_lov_id from tronix.sprav where sprav_id= psprav))';
tx:=tx+'||'' ''||(Select name from tronix.raz_lov where raz_lov_id=(Select raz_lov_raz_lov_id from tronix.sprav where sprav_id= psprav))';
tx:=tx+'||'' ''||(Select name from tronix.ty_lov where ty_lov_id=(Select ty_lov_ty_lov_id from tronix.sprav where sprav_id= psprav)) ';
tx:=tx+'||'' ''||(Select name from tronix.tym_lov where tym_lov_id=(Select tym_lov_tym_lov_id from tronix.sprav where sprav_id= psprav)) as name, ';
tx:=tx+' ROUND(sum(sum_potr),6) suma_potr,(Select namek from tronix.koded where koded_id=(Select koded_koded_id from tronix.sprav where sprav_id=psprav)) ed1,';
tx:=tx+' nvl(sum_zap_kol,0) vidano,ROUND((sum(sum_potr)-nvl(sum_zap_kol,0)),4) def from (';
tx:=tx+' Select  potr.sprav_sprav_id psprav, potr.kol*tronix_kof_koded(potr.sprav_sprav_id, potr.koded_koded_id,(Select koded_koded_id from tronix.sprav where sprav_id=potr.sprav_sprav_id)) sum_potr,';
tx:=tx+' z.sum_zap_kol ';
tx:=tx+' from tx_car_potr potr,';
tx:=tx+' (Select z_sprav_id,sum(zap_kol) sum_zap_kol from (';
tx:=tx+' Select zap.sprav_sprav_id z_sprav_id,(zap.kol_uchet*tronix_kof_koded(zap.sprav_sprav_id,zap.koded_koded_id_uchet, (Select koded_koded_id from tronix.sprav where sprav_id=zap.sprav_sprav_id))) zap_kol';
tx:=tx+'  from tronix.zapas zap';
tx:=tx+' where  zap.project_project_id='+oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and nvl((Select can_do_self from tronix.sprav where sprav_id=zap.sprav_sprav_id),0) =0';
tx:=tx+' and zap.dep_dep_id in (Select dep_id from nordsy.dep where dep_dep_id='+EDIT1.Text+' or dep_id='+EDIT1.Text+'))';
tx:=tx+' group by z_sprav_id) z';
tx:=tx+' where';
tx:=tx+'  potr.project_project_id='+oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and nvl((Select can_do_self from tronix.sprav where sprav_id=potr.sprav_sprav_id),0) =0';
tx:=tx+' and potr.sprav_sprav_id=z.z_sprav_id(+)';
tx:=tx+' and potr.dep_dep_id in (Select dep_id from nordsy.dep where dep_dep_id='+EDIT1.Text+' or dep_id='+EDIT1.Text+' ))';
tx:=tx+' group by psprav,sum_zap_kol';
tx:=tx+' order by kod';
 Form38.OraQuery1.SQL.Text:=tx;
 Form38.Label1.Caption:=oraQuery1.FieldByName('project_id').asString;
 Form38.Label2.Caption:=EDIT1.Text;
 Form38.ShowModal();
end;

  if (form9.caption='Проверка масс (спецификация и справочник)')   then
begin
  Form9.Close();
  Form27.Caption:='Проверка масс (спецификация и справочник). По '+OraQuery1.FieldByName('name').AsString;;
  Form27.Edit1.text:=oraQuery1.FieldByName('project_id').asString;
  Form27.ShowModal();
end;


if form9.caption='Техкомплекты в обеспечении материалами с признаком поступления'
then
 begin

tx:='Select (Select nomer from tx_texkompl where texkompl_id=tex_texkompl_id) nomer, ';
tx:=tx+' (Select kod from tronix.sprav where sprav_id=sprav_sprav_id) kod, ';
tx:=tx+'  tronix_sp_name(sprav_sprav_id) name, ';
tx:=tx+' (Select namek from tronix.koded where koded_id=tmat.koded_koded_id) ed, ';
tx:=tx+' decode(kol,null,''  '',kol) kol, ';
tx:=tx+' (Select name from nordsy.type_relation_poz where type_relation_poz_id=(Select type_relation_type_relation_id from tx_texkompl where texkompl_id= tmat.tex_texkompl_id))tn ';
tx:=tx+' from nordsy.tx_mat tmat ';
tx:=tx+' where type_relation_type_relation_id is not null ';
tx:=tx+' and sprav_sprav_id is not null ';
tx:=tx+' and  tex_texkompl_id in (Select texkompl_id from tx_texkompl where project_project_id='+ oraQuery1.FieldByName('project_id').asString+')';
tx:=tx+' and (Select type_tex_type_tex_id from tx_texkompl where texkompl_id= tmat.tex_texkompl_id) in (7,12) ';
  OraQuery3.SQL.Text:=tx;
 OraQuery3.ExecSQL;
 if OraQuery3.RecordCount>0 then
 begin
  OraQuery3.First;
  Application.CreateForm(TForm49, Form49);

  Form49.Caption:='Материалы с признаком поступления по '+OraQuery1.FieldByName('name').AsString;
       Form49.Show();
  With Form49 Do
    begin
       len_DATA:=OraQuery3.RecordCount;
       HEAD_TEXT:='A1;20;true;A1;F2;Материалы с признаком поступления по '+OraQuery1.FieldByName('name').AsString;
       COLUM_PARAM:='30;15;112,86;8,29;9;20;END;';
       COLUM_NAME:='4;Номер ТК;1;12;Код;1;12;Наименование;1;12;Ед.Изм.;1;12;Количество;1;12;Признак;1;12;END;';
       TAB_COLUM_PARAM:='@;@;@;@;@;@;@';
       TAB_COLUM_PARAM_ADD:='centre;xlLeft;true;no;centre;xlCenter;true;no;centre;xlLeft;true;no;down;xlRight;true;no;up;xlCenter;true;no;centre;xlRight;true;true;centre;xlCenter;true;true;';

       SetLength(DATA,len_DATA);
       e:=0;
       While NOT OraQuery3.EOF DO
          begin
       DATA[e]:= oraQuery3.FieldByName('nomer').asString+'|'+
       oraQuery3.FieldByName('kod').asString+'|'+
       oraQuery3.FieldByName('name').asString+'|'+
       oraQuery3.FieldByName('ed').asString+'|'+
       oraQuery3.FieldByName('kol').asString+'|'+
       oraQuery3.FieldByName('tn').asString;
        e:=e+1;
       OraQuery3.Next;
       end;
  //     ShowMEssage(IntTostr(e)+' '+IntTostr(len_DATA)+' '+IntTostr(OraQuery3.RecordCount));
      Otchet(Nil);
    end;
    end
    Else ShowMessage('Нет позиций по проекту '+OraQuery1.FieldByName('name').AsString);

end;

end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery2.Close;
    OraQuery1.Close;
    OraQuery3.Close;
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
 Edit2.Text:='All';
 if form9.caption='Наряды по цеху,проекту' then
begin
 Application.CreateForm(TFNaryd_Cex_Proekt, FNaryd_Cex_Proekt);
 FNaryd_Cex_Proekt.Edit1.Text:='All';
 FNaryd_Cex_Proekt.EDIT2.TEXT:=EDIT1.Text;
 FNaryd_Cex_Proekt.Caption:='Наряды';
 if EDIT1.Text <> 'All' then
 FNaryd_Cex_Proekt.Caption:=FNaryd_Cex_Proekt.Caption+' по всем проектам ЦЕХА='+Form32.oraQuery1.FieldByName('nomer').asString
 else
 FNaryd_Cex_Proekt.Caption:=FNaryd_Cex_Proekt.Caption+' по всем цехам и проектам';
 FNaryd_Cex_Proekt.ShowModal();
 FNaryd_Cex_Proekt.Free;
 end;

  if form9.caption='Перечень закрытой оснастки по проекту. Выберите проект' then
begin
 Application.CreateForm(TFSpisokCloseOsnastki, FSpisokCloseOsnastki);
 FSpisokCloseOsnastki.Edit1.Text:='All';
 FSpisokCloseOsnastki.Caption:='Оснастка закрытая по всем проектам';
 FSpisokCloseOsnastki.ShowModal();
 FSpisokCloseOsnastki.Free;
 end;

    if form9.caption='Запас МСЧ на ЦКС по ячейкам. Выберите проект' then
begin
  Application.CreateForm(TFReserve_Msch_Cks_Place, FReserve_Msch_Cks_Place);
  FReserve_Msch_Cks_Place.Edit1.Text:='All';
  FReserve_Msch_Cks_Place.Caption:='Запас МСЧ на ЦКС по ячейкам по всем проектам';
  FReserve_Msch_Cks_Place.ShowModal();
  FReserve_Msch_Cks_Place.Free;
end;
 end;

procedure TForm9.Button2Click(Sender: TObject);
var uzak, uzaki : string;
e : integer;

const
DATEMASK = 'DD.MM.YYYY';

begin
if (self.caption = 'Дефицит по номенклатуре (новый)') then
begin
  uzak := '-1';
	for e := 0 to uzaks.Items.Count - 1 do
		if uzaks.Checked[e] then
    begin
			uzak := uzak + ', ' + uzaks_memory.Items[e];
      uzaki := uzaki + ' ' + uzaks.Items[e];
    end;

	if uzak = '-1' then
	begin
		showmessage('Выберите минимум 1 заказ!');
		exit;
	end;

  Application.CreateForm(TDIF_OTCH_FORM, DIF_OTCH_FORM);
  if Form1.SCAlive then
  begin
    Label2.Caption := '(' + uzak + ')';
    DIF_OTCH_FORM.Caption := form9.Caption + ' ' + uzaki;
    DIF_OTCH_FORM.ShowModal();
  end;
  DIF_OTCH_FORM.Free;

  exit;
end;

if (self.caption = 'Требования по дефициту') then
begin
  uzak := '-1';
	for e := 0 to uzaks.Items.Count - 1 do
		if uzaks.Checked[e] then
    begin
			uzak := uzak + ', ' + uzaks_memory.Items[e];
      uzaki := uzaki + ' ' + uzaks.Items[e];
    end;

	if uzak = '-1' then
	begin
		showmessage('Выберите минимум 1 заказ!');
		exit;
	end;

  Application.CreateForm(Ttrnomen, trnomen);

  trnomen.Caption := form9.Caption + ': ' + uzaki;
  trnomen.OraQueryS.SQL.Text := 'SELECT TXK.NOMER as PUE, SPRAVA.KOD as KOD, SPRAVO.KOD as VYD, TN.NOMER as NOMER, TP.NAME as TYPE, '
  + 'decode(DPO.TYPE_DEP_TYPE_DEP_ID, 2, DPO.NOMER, DPT.NOMER) as CEH, DPP.NOMER as SKLAD, DCG.IDENT as CHERT, ROUND(TNMAT.KOL_UCHET, 5) as KOL_UCHET, '
  + 'ROUND(TNMAT.KOL, 5) as KOL, TO_CHAR(TN.DATE_DOK, ' + char(39) + DATEMASK + char(39) + ') as DATEC, '
  + 'TO_CHAR(TN.USER_DATE1, ' + char(39) + DATEMASK + char(39) + ') as DATE1, TO_CHAR(TN.USER_DATE2, ' + char(39) + DATEMASK + char(39) + ') as DATE2, '
  + 'TO_CHAR(TN.DATE_INS, ' + char(39) + DATEMASK + char(39) + ') as DATE3, TO_CHAR(TN.USER_DATE4, ' + char(39) + DATEMASK + char(39) + ') as DATE4 '
  + 'FROM (select defa.s_i as sprav_id from (select src.SPRAV_ID as s_i, (src.POTR - src.ZAPAS) as d, '
  + '((src.POTR * tronix_kof_koded(src.sprav_id, src.koded_potr, src.koded_uchet)) - (src.ZAPAS * tronix_kof_koded(src.sprav_id, src.koded_potr, '
  + 'src.koded_uchet))) as d_u from (select tt.sprav_id as sprav_id, sum(tt.POTR) as potr, sum(tt.ZAPAS) as zapas, tt.koded_potr as koded_potr, '
  + 'tt.koded_uchet as koded_uchet from (select tx.sprav_sprav_id as sprav_id, nvl(tx.KOL, 0) as POTR, nvl(tx.ZAPAS_POST, 0) AS ZAPAS, '
  + 'tx.KODED_KODED_ID as koded_potr, nvl(sp.koded_koded_id2, sp.koded_koded_id) as koded_uchet from tx_car_potr tx, tronix_sprav sp '
  + 'where tx.sprav_sprav_id = sp.sprav_id(+) and tx.uzak_uzak_id in (' + uzak + ')) tt group by tt.sprav_id, tt.koded_potr, tt.koded_uchet) src ) defa '
  + 'where (defa.d > 0 or defa.d_u > 0)) deficit, TRONIX_SPRAV SPRAVA, TRONIX_SPRAV SPRAVO, TRONIX.TYPE_TTN TP, TRONIX.TTN TN, TRONIX.TTN_MAT TNMAT, '
  + 'KADRY_DEP DPO, KADRY_DEP DPT, KADRY_DEP DPP, TRONIX.SP SPG, TRONIX.DOCUMENT DCG, TX_TEXKOMPL TXK WHERE TN.UZAK_UZAK_ID in (' + uzak + ') AND TN.TYPE_TTN_TYPE_TTN_ID in '
  + '(5, 43, 44, 26, 59, 11) '
  + 'AND TNMAT.TTN_TTN_ID = TN.TTN_ID AND ((TNMAT.SPRAV_SPRAV_ID = deficit.sprav_id AND TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB is null) OR '
  + 'TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB = deficit.sprav_id) AND DECODE(TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB, null, TNMAT.SPRAV_SPRAV_ID, TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB) '
  + '= SPRAVA.SPRAV_ID(+) AND TNMAT.TEXKOMPL_TEXKOMPL_ID = TXK.TEXKOMPL_ID(+) AND TNMAT.SPRAV_SPRAV_ID = SPRAVO.SPRAV_ID(+) AND TN.DEP_DEP_ID_TO = DPO.DEP_ID(+) AND DPO.DEP_DEP_ID = DPT.DEP_ID(+) AND '
  + 'TN.TYPE_TTN_TYPE_TTN_ID = TP.TYPE_TTN_ID(+) AND (TN.DATE_INS is null or TN.USER_DATE3 is null) AND TN.DEP_DEP_ID_FROM = DPP.DEP_ID(+) AND '
  + 'TNMAT.SP_SP_ID = SPG.NN(+) AND SPG.NNN = DCG.DOCUMENT_ID(+)';
  //Clipboard.AsText := trnomen.OraQueryS.SQL.Text;
  //showmessage(trnomen.OraQueryS.SQL.Text);

  trnomen.ShowModal();
  trnomen.Free;

  exit;
end;

if (self.caption = 'Норма расхода материала для расчета цены по проекту (ЦФЭК)') then
begin
  self.caption := 'NORMSPENTMAT_FOR_COST_BYPROJECT';
  DBGridEh1DblClick(nil);

  exit;
end;

DBGridEh1DblClick(nil); //отчет по материальной ведомости!!!

end;

procedure TForm9.DBGridEh1CellClick(Column: TColumnEh);
var FILTER_S : string;
begin
if ((self.Caption = 'Отчет по материальной ведомости') or (self.caption = 'Дефицит по номенклатуре (новый)')(* or (self.caption = 'Требования по дефициту')*)) then
begin

  uzaks_memory.Clear;
  uzaks.Clear;

  if not allzakz.Checked then
    FILTER_S := '(zak.DATE_END is null or TO_CHAR(zak.DATE_END) is null)'
  else
    FILTER_S := '(1 = 1)';

  OraQuery2.Close;
  OraQuery2.SQL.Text := 'Select zak.zak, feb.text, zak.id_project, zak.nn from tronix.feb_name feb, tronix.zakaz zak '
  + 'where zak.name = feb.nn and ' + FILTER_S + ' order by zak.zak desc';
  OraQuery2.Open;

  OraQuery2.First;
  while not OraQuery2.Eof do
  begin
    uzaks.Items.Add(OraQuery2.FieldByName('zak').AsString + ' ' + OraQuery2.FieldByName('text').asString);
    uzaks_memory.Items.Add(OraQuery2.FieldByName('nn').asString);

    OraQuery2.Next;
  end;
  OraQuery2.First;

  exit;
end;
end;

function TForm9.excelFloat(s : string) : real;
begin
  excelFloat := strtofloat('0' + DecimalSeparator + '0');
  if s <> '' then
  begin
    if DecimalSeparator = '.' then
      excelFloat := strtofloat(StringReplace(s, ',', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]))
    else if DecimalSeparator = ',' then
      excelFloat := strtofloat(StringReplace(s, '.', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]))
  end;
end;

procedure TForm9.allprsClick(Sender: TObject);
begin
  ProjectList;
end;

end.
