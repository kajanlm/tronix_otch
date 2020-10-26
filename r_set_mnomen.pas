unit r_set_mnomen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, Ora, StdCtrls, jpeg,
  ExtCtrls, clipbrd;

type
  Tset_mnomen = class(TForm)
    DataSource: TOraDataSource;
    Query: TOraQuery;
    OraInsert: TOraQuery;
    grid: TDBGridEh;
    skod: TEdit;
    Label1: TLabel;
    Image2: TImage;
    block: TPanel;
    ceh: TComboBox;
    invi_ceh: TComboBox;
    Label4: TLabel;
    nomen_list: TButton;
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure skodKeyPress(Sender: TObject; var Key: Char);
    procedure DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure gridDblClick(Sender: TObject);
    procedure cehChange(Sender: TObject);
    procedure blockClick(Sender: TObject);
    procedure nomen_listClick(Sender: TObject);
  private
    { Private declarations }
    procedure Select;
  public
    { Public declarations }
    date_f,
    date_s, PRIKAZ_ID : string;
  end;

var
  set_mnomen: Tset_mnomen;

implementation

uses Unit1, Unit9, t_utils, r_set_mnomen_details;

{$R *.dfm}

procedure Tset_mnomen.Select;
var
  SQL : string;
const
  SQL_FILTER_KOD = 'sp.kod like ';
begin
  if ceh.ItemIndex = -1  then
  begin
    showmessage('Выберите цех!');
    exit;
  end;

  block.Visible := false;

  SQL :=
  'select defa.uzak_id, defa.dep_id, 0 as flag_two, decode(main.need_kol, null, 0, 1) as flag, '
  + 'decode(main.need_kol, null, 0, round((main.need_kol * tronix_kof_koded(sp.sprav_id, main.koded_id, defa.koded_potr)), 4)) as main_kol, '
  + 'decode(main.need_kol, null, 0, round((main.need_kol * tronix_kof_koded(sp.sprav_id, main.koded_id, defa.koded_uchet)), 4)) as main_kol_uchet, '
  + 'decode(main.need_kol, null, 0, round((main.zapas_kol * tronix_kof_koded(sp.sprav_id, main.koded_id, defa.koded_potr)), 4)) as main_zapas, '
  + 'decode(main.need_kol, null, 0, round((main.zapas_kol * tronix_kof_koded(sp.sprav_id, main.koded_id, defa.koded_uchet)), 4)) as main_zapas_uchet, '
  + 'defa.s_i as sprav_id, sp.kod, substr(upper(ltrim(tronix_sp_sp_name(defa.s_i, null, 3))), 1, 200) as MTR_NAME, round(defa.potr, 4) as potr, '
  + 'fkd.namek as ed_izm, defa.koded_potr as koded, round(defa.potr_uchet, 4) as potr_uchet, skd.namek as uch_ed_izm, defa.koded_uchet as koded_uchet, '
  + 'round(defa.zapas, 4) as zapas, round(defa.zapas_uchet, 4) as zapas_uchet, defa.d as deficit, defa.d_u as deficit_uchet '
  + 'from (select A.*, round((A.potr - A.zapas), 4) as d, round((A.potr_uchet - A.zapas_uchet), 4) as d_u from (select src.dep_id, src.uzak_id, src.POTR, '
  + '(src.POTR * tronix_kof_koded(src.sprav_id, src.koded_potr, src.koded_uchet)) as potr_uchet, src.ZAPAS, '
  + '(src.ZAPAS * tronix_kof_koded(src.sprav_id, src.koded_potr, src.koded_uchet)) as zapas_uchet, src.SPRAV_ID as s_i, src.koded_potr, src.koded_uchet from '
  + '(select tt.dep_id, tt.uzak_id, tt.sprav_id as sprav_id, sum(tt.POTR) as potr, sum(tt.ZAPAS_TR) as zapas, tt.koded_potr as koded_potr, '
  + 'tt.koded_uchet as koded_uchet from (select tx.sprav_sprav_id as sprav_id, nvl(tx.KOL, 0) as POTR, nvl(tx.ZAPAS_POST_TR, 0) as ZAPAS_TR, '
  + 'tx.KODED_KODED_ID as koded_potr, nvl(sp.koded_koded_id2, sp.koded_koded_id) as koded_uchet, tx.dep_dep_id as dep_id, tx.uzak_uzak_id as uzak_id '
  + 'from tx_car_potr tx, tronix_sprav sp where nvl(sp.CAN_DO_SELF, 0) <> 1 and tx.sprav_sprav_id = sp.sprav_id(+) and tx.dep_dep_id = <DEP_ID> and tx.uzak_uzak_id = <UZAK_ID>) tt '
  + 'group by tt.sprav_id, tt.koded_potr, tt.koded_uchet, tt.dep_id, tt.uzak_id) src ) A ) '
  + 'defa, tronix_sprav sp, tronix.koded fkd, tronix.koded skd, (select TO_CHAR(m.date_ins, ' + char(39) + 'mm.YYYY' + char(39) + ') as fdate, m.* from '
  + 'tronix.main_nomenclature m) main where (defa.d > 0 or defa.d_u > 0) and '
  + 'defa.koded_potr = fkd.koded_id(+) and defa.koded_uchet = skd.koded_id(+) and defa.s_i = sp.sprav_id(+) and '
  + char(39) + date_f + '.' + date_s + char(39) + ' = main.fdate(+) and '
  + 'defa.s_i = main.sprav_id(+) and defa.dep_id = main.dep_id(+) and defa.uzak_id = main.uzak_id(+) and <KOD_FILTER> order by sp.kod desc';
  //13.02.2020 10:20 "remove TO_NUMBER(kod) sorting; error: INVALID NUMBER from KOD with cyrilic symbols"!

  //round to 6 (maybe 5) and corret 2E-6 to 0,000002 (to_char) ".", float ","

  SQL := StringReplace(SQL, '<UZAK_ID>', form9.Label2.Caption, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<DEP_ID>', invi_ceh.Items[ceh.itemIndex], [rfReplaceAll, rfIgnoreCase]);

  if (length(skod.Text) > 2) then
    SQL := StringReplace(SQL, '<KOD_FILTER>', SQL_FILTER_KOD + char(39) + '%' + skod.text + '%' + char(39), [rfReplaceAll, rfIgnoreCase])
  else
    SQL := StringReplace(SQL, '<KOD_FILTER>', '(1 = 1)', [rfReplaceAll, rfIgnoreCase]);

  //Clipboard.asText := SQL;
  //showmessage(SQL);
  form1.execQuery(Query, SQL, false);
  if Query.RecordCount < 1 then
    exit
  else
    Query.First;
end;

procedure Tset_mnomen.FormShow(Sender: TObject);
var SQL : string;
begin
  //Select;
  SQL := 'select dp.type_dep_type_dep_id as type_dep, dp.dep_id, dp.nomer as ceh, o.prikaz_id from (select pii.prikaz_id, pii.dep_dep_id as dep_id '
  + 'from kadry_prikaz pii, kadry_type_prikaz tpp where pii.ts_number=USER and pii.escape_date is null and '
  + 'pii.type_prikaz_type_prikaz_id = tpp.type_prikaz_id and tpp.kod = 1) o, kadry_dep dp where o.dep_id = dp.dep_id';
  form1.execQuery(OraInsert, SQL, false);

  if ((OraInsert.RecordCount < 1) or (OraInsert.RecordCount > 1)) then
  begin
    if not form1.showError('Ошибка запроса получения подразделения', 'Приложение будет закрыто! Если присутствуют не сохраненные данные '
    + ' - обратитесь в АСУ и не закрывайте ошибку.') then
      Application.Terminate;
  end
  else
    OraInsert.First;

  PRIKAZ_ID := OraInsert.FieldByName('PRIKAZ_ID').asString;
  invi_ceh.Clear;
  ceh.Clear;

  if OraInsert.FieldByName('type_dep').asString = '2' then
  begin
    invi_ceh.Items.Add(OraInsert.FieldByName('dep_id').asString);
    ceh.Items.Add(OraInsert.FieldByName('ceh').asString);
    ceh.ItemIndex := 0;

    Select;
    exit;
  end;

  SQL := 'select dep_id, nomer from kadry_dep where type_dep_type_dep_id = 2 order by nomer ASC';

  form1.execQuery(OraInsert, SQL, false);
  if OraInsert.RecordCount < 1 then
  begin
    if not form1.showError('Ошибка запроса списка подразделений', 'Приложение будет закрыто! Если присутствуют не сохраненные данные '
    + ' - обратитесь в АСУ и не закрывайте ошибку.') then
      Application.Terminate;
  end
  else
    OraInsert.First;

  while not OraInsert.Eof do
  begin
    invi_ceh.items.add(OraInsert.FieldByName('dep_id').asString);
    ceh.items.add(OraInsert.FieldByName('nomer').asString);

    OraInsert.Next;
  end;
  OraInsert.Close;

  ceh.ItemIndex := -1;
end;

procedure Tset_mnomen.Image2Click(Sender: TObject);
begin
  Select;
end;

procedure Tset_mnomen.skodKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Select;
end;

procedure Tset_mnomen.DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if ((Column.Field.DataSet.FieldByName('flag').asString = '1') or (Column.Field.DataSet.FieldByName('flag_two').asString = '1')) then
    grid.Canvas.Brush.Color := TColor(RGB(33, 255, 0));

  grid.DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure Tset_mnomen.gridDblClick(Sender: TObject);
var
  Pointer : TDataSet;
  SQL : string;
begin
  if Query.RecordCount = 0 then
    exit;
    
  if (grid.DataSource.DataSet.FieldByName('flag_two').asString = '1') then
  begin
    showmessage('Данная номенклатура уже задана, чтобы посмотреть детали: обновите список!');
    exit;
  end;

  Application.CreateForm(Tset_mnomen_details, set_mnomen_details);

  Pointer := grid.DataSource.DataSet;
  set_mnomen_details.Caption := 'Установка номенклатуры: ' + char(39) + Pointer.FieldByName('kod').asString + char(39);

  set_mnomen_details.invi_zapas.Items.Add(Pointer.FieldByName('zapas').asString);
  set_mnomen_details.invi_zapas.Items.Add(Pointer.FieldByName('zapas_uchet').asString);

  set_mnomen_details.invi_deficit.Items.Add(Pointer.FieldByName('deficit').asString);
  set_mnomen_details.invi_deficit.Items.Add(Pointer.FieldByName('deficit_uchet').asString);

  set_mnomen_details.invi_edizm.Items.Add(Pointer.FieldByName('koded').asString);
  set_mnomen_details.invi_edizm.Items.Add(Pointer.FieldByName('koded_uchet').asString);

  set_mnomen_details.edizm.Items.Add(Pointer.FieldByName('ed_izm').asString);
  set_mnomen_details.edizm.Items.Add(Pointer.FieldByName('uch_ed_izm').asString);
  set_mnomen_details.edizm.ItemIndex := 0;

  if (Pointer.FieldByName('flag').asString = '1') then
  begin
    set_mnomen_details.Caption := set_mnomen_details.Caption + ' (УСТАНОВЛЕНО)';
    set_mnomen_details.Button1.Visible := false;
    set_mnomen_details.need.ReadOnly := true;
    set_mnomen_details.left_label.Visible := true;
    set_mnomen_details.left.Visible := true;
    
    set_mnomen_details.invi_need.Items.Add(Pointer.FieldByName('MAIN_KOL').asString);
    set_mnomen_details.invi_need.Items.Add(Pointer.FieldByName('MAIN_KOL_UCHET').asString);
    set_mnomen_details.invi_main_zapas.Items.Add(Pointer.FieldByName('main_zapas').asString);
    set_mnomen_details.invi_main_zapas.Items.Add(Pointer.FieldByName('main_zapas_uchet').asString);
  end
  else
    set_mnomen_details.Button1.Enabled := true;

  set_mnomen_details.Calc;

  set_mnomen_details.RETURN_DATA := '';
  set_mnomen_details.ShowModal();

  if set_mnomen_details.RETURN_DATA <> '' then
  begin
    SQL := 'INSERT INTO tronix.main_nomenclature (SPRAV_ID, ZAPAS_KOL, NEED_KOL, KODED_ID, UZAK_ID, DEP_ID, USER_PRIKAZ_ID, DATE_INS) '
    + 'VALUES (' + Pointer.FieldByName('SPRAV_ID').asString + ', ' + set_mnomen_details.RETURN_DATA + ', ' + Pointer.FieldByName('UZAK_ID').asString + ', '
    + Pointer.FieldByName('DEP_ID').asString + ', ' + PRIKAZ_ID + ', TO_DATE(' + char(39) + (FormatDateTime('dd', Now)) + '.' + date_f + '.' + date_s
    + char(39) + ', ' + char(39) + 'dd.mm.YYYY' + char(39) + '))';

    //showmessage(SQL);
    form1.execQuery(OraInsert, SQL, true);
    
    //Select;
    Pointer.Edit;
    Pointer.FieldByName('FLAG_TWO').Value := '1';

    showmessage('Номенклатура внесена!');
    //grid.Repaint;
  end;

  set_mnomen_details.Free;
end;

procedure Tset_mnomen.cehChange(Sender: TObject);
begin
  if ceh.ItemIndex <> -1  then
  begin
    block.Caption := 'Нажмите сюда для выполнения запроса!';
    block.Visible := true;
  end;
end;

procedure Tset_mnomen.blockClick(Sender: TObject);
begin
  Select;
end;

procedure Tset_mnomen.nomen_listClick(Sender: TObject);
var ch : string;
begin
  if MessageDlg('Создать EXCEL-отчет: Перечень основной номенклатуры за период: ' +date_f + '.' + date_s + '?',
  mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  if ceh.itemIndex <> -1 then
    ch := ceh.Items[ceh.itemIndex]
  else
    ch := '';//unassigned;

  main_nomenclature_list(date_f, date_s, ch);
end;

end.
