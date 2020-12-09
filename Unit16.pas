unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, ExcelXP, OleServer,
  StdCtrls,DBGridEhImpExp, GridsEh, DBGrids, DBClient, ExtCtrls, CheckLst,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, jpeg;

type
  TDIF_OTCH_FORM = class(TForm)
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    DataSource: TOraDataSource;
    OraQuery: TOraQuery;
    DBGridEh1: TDBGridEh;
    OraQueryKOD: TStringField;
    OraQueryMTR_NAME: TStringField;
    OraQueryPOTR: TFloatField;
    OraQueryED: TStringField;
    OraQueryPOTR_UCHET: TFloatField;
    OraQueryED_UCHET: TStringField;
    OraQueryZAPAS_POST: TFloatField;
    OraQueryZAPAS_POST_UCHET: TFloatField;
    OraQueryZAPAS_POST_SUB: TFloatField;
    OraQueryZAPAS_POST_SUB_UCHET: TFloatField;
    LOCK_BOX: TPanel;
    cb_typepodr: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cb_podr: TComboBox;
    Edit1: TEdit;
    Panel1: TPanel;
    OraDataSource1: TOraDataSource;
    OraQueryS: TOraQuery;
    cb_invi_typepodr: TComboBox;
    cb_invi_podr: TComboBox;
    cb_invi_podr_name: TComboBox;
    filter_type: TCheckListBox;
    ComboBox1: TComboBox;
    OraQuerySPRAV_ID: TFloatField;
    OraQueryZAM_FLAG: TStringField;
    filter_query: TEdit;
    cbt_filter: TComboBox;
    Image1: TImage;
    Image2: TImage;
    OraQueryDEFICIT: TStringField;
    OraQueryDEFICIT_UCHET: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure CalcDeficit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_typepodrChange(Sender: TObject);
    procedure cb_podrChange(Sender: TObject);
    procedure cb_typeelmsChange(Sender: TObject);
    procedure filter_typeClick(Sender: TObject);
    procedure filter_typeClickCheck(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure LOCK_BOXMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Image1Click(Sender: TObject);
    procedure filter_queryChange(Sender: TObject);
    procedure cbt_filterClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
    procedure Execute_SQL(SQL: string);
    procedure CalcTypeText;
    procedure parseFilterMask;
  public
    { Public declarations }
  end;

var
  DIF_OTCH_FORM: TDIF_OTCH_FORM;
  ELEM_DEP,
  ELEM_DEP_TYPE,
  ELEM_TYPE,
  SORT_FIELD,
  SORT_TYPE,
  EVAL_DEP,
  FILTER_MASK,
  SFILTER_MASK,
  GLOBAL_SQL
  : string;
  
implementation

uses Unit15, Unit5, Unit9, addzams, unit1, ftrnomen;

{$R *.dfm}

procedure TDIF_OTCH_FORM.CalcDeficit(Sender: TObject);
var

SQL
: string;

begin

if form1.SCAlive then
begin
  if (cb_typepodr.ItemIndex = 0) then
    SQL := form1.ServerRequest('DEFICIT_ZAVOD')
  else
    SQL := form1.ServerRequest('DEFICIT');
end
else
  exit;

if cb_typepodr.ItemIndex = 0 then
begin
  ELEM_DEP := '1';
  ELEM_DEP_TYPE := '1 = 1';
end
else
begin

  if cb_podr.ItemIndex = -1 then
    ELEM_DEP := '1'
  else
    ELEM_DEP := cb_invi_podr.Items[cb_podr.ItemIndex];

  ELEM_DEP_TYPE := 'TYPE_DEP_TYPE_DEP_ID = ' + cb_invi_typepodr.Items[cb_typepodr.ItemIndex];
end;

ELEM_TYPE := '(';

if filter_type.Checked[0] then
  ELEM_TYPE := ELEM_TYPE + '(tronix_select_mat(TRONIX_SPRAV.tree_tree_id, ''01'' ) = 1 AND NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) <> 1) or ';

if filter_type.Checked[1] then
  ELEM_TYPE := ELEM_TYPE + '(tronix_select_mat(TRONIX_SPRAV.tree_tree_id, ''02'' ) = 1 AND NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) <> 1) or '
else
  ELEM_TYPE := ELEM_TYPE + '(1 = 2) or ';

if filter_type.Checked[2] then
  ELEM_TYPE := ELEM_TYPE + '(NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) = 1) or '
else
  ELEM_TYPE := ELEM_TYPE + '(1 = 2) or ';

if filter_type.Checked[3] then
  ELEM_TYPE := ELEM_TYPE + '(1 = 1)'
else
  ELEM_TYPE := ELEM_TYPE + '(1 = 2)';

ELEM_TYPE := ELEM_TYPE + ')';

if (cb_typepodr.ItemIndex = 0) then
  EVAL_DEP := ''
else
  EVAL_DEP := '_TR';

SQL := StringReplace(SQL, '<UZAK_ID>', form9.Label2.Caption, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<DEP_ID>', ELEM_DEP, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<TYPE_DEP_ID>', ELEM_DEP_TYPE, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<TYPE_ELEMS>', ELEM_TYPE, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<ORDER_FIELD>', SORT_FIELD, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<ORDER_TYPE>', SORT_TYPE, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<EVAL_TYPE_DEP>', EVAL_DEP, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<FILTER_MASK>', FILTER_MASK, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<SFILTER_MASK>', SFILTER_MASK, [rfReplaceAll, rfIgnoreCase]);

SQL := StringReplace(SQL, '<DEFICIT_MASK>', 'b.deficit > 0 or b.deficit_uchet > 0', [rfReplaceAll, rfIgnoreCase]);

OraQuery.Close;
OraQuery.SQL.Text := SQL;
OraQuery.ExecSQL;

GLOBAL_SQL := SQL;

LOCK_BOX.Visible := false;

DBGridEh1.Enabled := true;
if OraQuery.RecordCount <> 0 then
  Button1.Enabled := true
else
  DBGridEh1.Enabled := false;

end;

procedure TDIF_OTCH_FORM.Button1Click(Sender: TObject);
var
ExcelApplication:TExcelApplication;
Range, Sheet: VAriant;
begin
  ExcelApplication := TExcelApplication.Create(Self);
  ExcelApplication.ConnectKind := ckNewInstance;
  ExcelApplication.Connect;
  ExcelApplication.AutoQuit := true;
  ExcelWorkbook1.ConnectTo(ExcelApplication.Workbooks.Add(EmptyParam,LOCALE_USER_DEFAULT));
  ExcelWorkBook1.Activate(LOCALE_USER_DEFAULT);
  ExcelWorksheet1.ConnectTo(ExcelApplication.ActiveWorkbook.ActiveSheet as ExcelWorkSheet);

  Sheet := ExcelWorkbook1.Sheets[1];
  Range := Sheet.Columns;

  with SaveDialog1 do
    begin
      InitialDir :=ExtractFilePath(Application.ExeName);
      Filter :='Exell files (*.xls)|*.xls|All files (*.*)|*.*';
      if SaveDialog1.Execute then begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,SaveDialog1.FileName+ '.xls' ,true);
    end;
  end;
end;

procedure TDIF_OTCH_FORM.Execute_SQL(SQL: string);
begin
LOCK_BOX.Visible := true;

OraQueryS.Close;
OraQueryS.SQL.Text := SQL;
OraQueryS.Open;
end;

procedure TDIF_OTCH_FORM.FormShow(Sender: TObject);
begin

cb_typepodr.Clear;
cb_podr.Clear;

cb_invi_typepodr.Clear;
cb_invi_podr.Clear;

SORT_FIELD := 'KOD';
SORT_TYPE := 'ASC';
FILTER_MASK := '(1 = 1)';
SFILTER_MASK := '(1 = 1)';

Execute_SQL('SELECT * FROM KADRY_TYPE_DEP WHERE KOD in (''01'', ''02'', ''04'', ''05'', ''07'', ''08'') ORDER BY NAME ASC');

cb_typepodr.Items.Add('Завод');
cb_invi_typepodr.Items.Add('ZAVOD');

OraQueryS.First;
while not OraQueryS.Eof do
begin
  cb_typepodr.Items.Add(OraQueryS.FieldByName('NAME').asString);
  cb_invi_typepodr.Items.Add(OraQueryS.FieldByName('type_dep_id').asString);

  OraQueryS.Next;
end;

cb_typepodr.ItemIndex := 0;
cb_podr.Items.Add('ЯСЗ');
cb_podr.ItemIndex := 0;
edit1.Text := 'Ярославский судостроительный завод';

filter_type.Checked[3] := true;

end;

procedure TDIF_OTCH_FORM.cb_typepodrChange(Sender: TObject);
begin

LOCK_BOX.Visible := true;
Button1.Enabled := false;

if cb_typepodr.ItemIndex = -1 then
  exit;

cb_podr.Clear;
cb_invi_podr.Clear;
cb_invi_podr_name.Clear;

if cb_typepodr.ItemIndex <> 0 then
begin
  Execute_SQL('SELECT * FROM KADRY_DEP WHERE TYPE_DEP_TYPE_DEP_ID = ' + cb_invi_typepodr.Items[cb_typepodr.ItemIndex] + ' ORDER BY NOMER ASC');

  OraQueryS.First;
  while not OraQueryS.Eof do
  begin
    cb_podr.Items.Add(OraQueryS.FieldByName('NOMER').asString);
    cb_invi_podr.Items.Add(OraQueryS.FieldByName('DEP_ID').asString);
    cb_invi_podr_name.Items.Add(OraQueryS.FieldByName('NAME').asString);

    OraQueryS.Next;
  end;

cb_podr.ItemIndex := -1;
cb_podr.Enabled := true;
edit1.text := '';

end
else
begin
  cb_podr.Enabled := false;
  cb_podr.Items.Add('ЯСЗ');
  cb_podr.ItemIndex := 0;
  edit1.Text := 'Ярославский судостроительный завод';
end;

end;

procedure TDIF_OTCH_FORM.cb_podrChange(Sender: TObject);
begin

LOCK_BOX.Visible := true;
Button1.Enabled := false;

if cb_podr.ItemIndex = -1 then
  exit;

Edit1.Text := cb_invi_podr_name.Items[cb_podr.ItemIndex];
end;

procedure TDIF_OTCH_FORM.cb_typeelmsChange(Sender: TObject);
begin
LOCK_BOX.Visible := true;
Button1.Enabled := false;
end;

procedure TDIF_OTCH_FORM.CalcTypeText;
var i : integer;
begin
if filter_type.Checked[3] then
  combobox1.Items[0] := filter_type.Items[3]
else
begin

combobox1.Items[0] := '[';
for i := 0 to 3 do
  if filter_type.Checked[i] then
    combobox1.Items[0] := Combobox1.Items[0] + filter_type.Items[i] + ';';

combobox1.Items[0] := combobox1.Items[0] + ']';
end;

combobox1.ItemIndex := 0;
end;

procedure TDIF_OTCH_FORM.filter_typeClick(Sender: TObject);
begin
if (((not filter_type.Checked[0]) and (not filter_type.Checked[1]) and (not filter_type.Checked[2])) or ((filter_type.Checked[0]) and (filter_type.Checked[1]) and (filter_type.Checked[2]))) then
begin
  filter_type.Checked[0] := false;
  filter_type.Checked[1] := false;
  filter_type.Checked[2] := false;
  filter_type.Checked[3] := true;
end;

if ((filter_type.Checked[0]) or (filter_type.Checked[1]) or (filter_type.Checked[2])) then
  filter_type.Checked[3] := false;

CalcTypeText;
LOCK_BOX.Visible := true;
end;

procedure TDIF_OTCH_FORM.filter_typeClickCheck(Sender: TObject);
begin
if (((not filter_type.Checked[0]) and (not filter_type.Checked[1]) and (not filter_type.Checked[2])) or ((filter_type.Checked[0]) and (filter_type.Checked[1]) and (filter_type.Checked[2]))) then
begin
  filter_type.Checked[0] := false;
  filter_type.Checked[1] := false;
  filter_type.Checked[2] := false;
  filter_type.Checked[3] := true;
end;

if ((filter_type.Checked[0]) or (filter_type.Checked[1]) or (filter_type.Checked[2])) then
  filter_type.Checked[3] := false;

CalcTypeText;
LOCK_BOX.Visible := true;
end;

procedure TDIF_OTCH_FORM.FormClick(Sender: TObject);
begin
filter_type.Visible := false;
combobox1.Visible := true;
end;

procedure TDIF_OTCH_FORM.ComboBox1Click(Sender: TObject);
begin
combobox1.Visible := false;
filter_type.Visible := true;
end;

procedure TDIF_OTCH_FORM.ComboBox1DropDown(Sender: TObject);
begin
combobox1.Visible := false;
filter_type.Visible := true;
end;

procedure TDIF_OTCH_FORM.LOCK_BOXMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
filter_type.Visible := false;
combobox1.Visible := true;
end;

procedure TDIF_OTCH_FORM.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
filter_type.Visible := false;
combobox1.Visible := true;
end;

procedure TDIF_OTCH_FORM.DBGridEh1DblClick(Sender: TObject);

var

SQL_Tx,
SQL_Zam,
SQL_Zams,
ELEM_DEP_STYPE
: string;

const
DATEMASK = 'DD.MM.YYYY';

begin

if MessageDlg('Выберите дальнейшее действие. Да - просмотр замен. Нет - просмотр требований.', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
begin
Application.CreateForm(Ttrnomen, trnomen);
if MessageDlg('Требования по: Да - по всему дефициту. Нет - по выбранной номенклатуре.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
(* весь *)

trnomen.OraQueryS.SQL.Text := 'SELECT TXK.NOMER as PUE, SPRAVA.KOD as KOD, SPRAVO.KOD as VYD, '
+ 'TN.NOMER as NOMER, TP.NAME as TYPE, decode(DPO.TYPE_DEP_TYPE_DEP_ID, 2, DPO.NOMER, DPT.NOMER) as CEH, DPP.NOMER as SKLAD, DCG.IDENT as CHERT, '
+ 'ROUND(TNMAT.KOL_UCHET, 5) as KOL_UCHET, ROUND(TNMAT.KOL, 5) as KOL, TO_CHAR(TN.DATE_DOK, ' + char(39) + DATEMASK + char(39) + ') as DATEC, '
+ 'TO_CHAR(TN.USER_DATE1, ' + char(39) + DATEMASK + char(39) + ') as DATE1, '
+ 'TO_CHAR(TN.USER_DATE2, ' + char(39) + DATEMASK + char(39) + ') as DATE2, '
+ 'TO_CHAR(TN.DATE_INS, ' + char(39) + DATEMASK + char(39) + ') as DATE3, TO_CHAR(TN.USER_DATE4, ' + char(39) + DATEMASK + char(39) + ') as DATE4 '
+ 'FROM TRONIX_SPRAV SPRAVA, TRONIX_SPRAV SPRAVO, '
+ 'TRONIX.TYPE_TTN TP, TRONIX.TTN TN, TRONIX.TTN_MAT TNMAT, TX_TEXKOMPL TXK, '
+ 'KADRY_DEP DPO, KADRY_DEP DPT, KADRY_DEP DPP, TRONIX.SP SPG, TRONIX.DOCUMENT DCG WHERE TN.UZAK_UZAK_ID in ' + form9.Label2.Caption + ' AND TN.TYPE_TTN_TYPE_TTN_ID in (43, 44, 26, 59, 11) AND '
+ 'TNMAT.TTN_TTN_ID = TN.TTN_ID AND TNMAT.TEXKOMPL_TEXKOMPL_ID = TXK.TEXKOMPL_ID(+) AND '
+ 'DECODE(TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB, null, TNMAT.SPRAV_SPRAV_ID, TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB) = SPRAVA.SPRAV_ID(+) AND '
+ 'TNMAT.SPRAV_SPRAV_ID = SPRAVO.SPRAV_ID(+) AND '
+ 'TN.DEP_DEP_ID_TO = DPO.DEP_ID(+) AND DPO.DEP_DEP_ID = DPT.DEP_ID(+) AND TN.TYPE_TTN_TYPE_TTN_ID = TP.TYPE_TTN_ID(+) AND '
+ '(TN.DATE_INS is null or TN.USER_DATE3 is null) AND TN.DEP_DEP_ID_FROM = DPP.DEP_ID(+) '
+ 'AND TNMAT.SP_SP_ID = SPG.NN(+) AND SPG.NNN = DCG.DOCUMENT_ID(+)';
//edit1.text := trnomen.OraQueryS.SQL.Text;

trnomen.Label5.Visible := true;

end
else
begin
(* выбранный *)

trnomen.OraQueryS.SQL.Text := 'SELECT TXK.NOMER as PUE, SPRAVA.KOD as KOD, SPRAVO.KOD as VYD, '
+ 'TN.NOMER as NOMER, TP.NAME as TYPE, decode(DPO.TYPE_DEP_TYPE_DEP_ID, 2, DPO.NOMER, DPT.NOMER) as CEH, DPP.NOMER as SKLAD, DCG.IDENT as CHERT, '
+ 'ROUND(TNMAT.KOL_UCHET, 5) as KOL_UCHET, ROUND(TNMAT.KOL, 5) as KOL, TO_CHAR(TN.DATE_DOK, ' + char(39) + DATEMASK + char(39) + ') as DATEC, '
+ 'TO_CHAR(TN.USER_DATE1, ' + char(39) + DATEMASK + char(39) + ') as DATE1, '
+ 'TO_CHAR(TN.USER_DATE2, ' + char(39) + DATEMASK + char(39) + ') as DATE2, '
+ 'TO_CHAR(TN.DATE_INS, ' + char(39) + DATEMASK + char(39) + ') as DATE3, TO_CHAR(TN.USER_DATE4, ' + char(39) + DATEMASK + char(39) + ') as DATE4 '
+ 'FROM TRONIX.TYPE_TTN TP, TRONIX.TTN TN, TRONIX.TTN_MAT TNMAT, TRONIX_SPRAV SPRAVA, TRONIX_SPRAV SPRAVO, '
+ 'KADRY_DEP DPO, KADRY_DEP DPT, KADRY_DEP DPP, TRONIX.SP SPG, TRONIX.DOCUMENT DCG, TX_TEXKOMPL TXK WHERE TN.UZAK_UZAK_ID in ' + form9.Label2.Caption + ' AND TN.TYPE_TTN_TYPE_TTN_ID in (43, 44, 26, 59, 11) AND '
+ 'TNMAT.TTN_TTN_ID = TN.TTN_ID AND '
+ '((TNMAT.SPRAV_SPRAV_ID = ' + dbgrideh1.DataSource.DataSet.FieldByName('SPRAV_ID').asString + ' AND '
+ 'TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB is null) OR '
+ 'TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB = ' + dbgrideh1.DataSource.DataSet.FieldByName('SPRAV_ID').asString + ') AND '
+ 'TNMAT.SPRAV_SPRAV_ID = SPRAVO.SPRAV_ID(+) AND TNMAT.TEXKOMPL_TEXKOMPL_ID = TXK.TEXKOMPL_ID(+) AND '
+ 'DECODE(TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB, null, TNMAT.SPRAV_SPRAV_ID, TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB) = SPRAVA.SPRAV_ID(+) AND '
+ 'TN.DEP_DEP_ID_TO = DPO.DEP_ID(+) AND DPO.DEP_DEP_ID = DPT.DEP_ID(+) AND TN.TYPE_TTN_TYPE_TTN_ID = TP.TYPE_TTN_ID(+) '
+ 'AND TN.DEP_DEP_ID_FROM = DPP.DEP_ID(+) AND TNMAT.SP_SP_ID = SPG.NN(+) AND SPG.NNN = DCG.DOCUMENT_ID(+)';

end;

trnomen.ShowModal();
trnomen.Free;
exit;

end;

if form1.SCAlive then
begin
  SQL_Tx := form1.ServerRequest('TXKOMPL_POS_FROM_POTR');
  SQL_Zam := form1.ServerRequest('_ZAMENY');
  SQL_Zams := form1.ServerRequest('ZAMENY_');
end
else
  exit;

if ELEM_DEP_TYPE = '1 = 1' then
  ELEM_DEP_STYPE := 'TYPE_DEP_TYPE_DEP_ID is not null or (1 = 1)'
else
  ELEM_DEP_STYPE := ELEM_DEP_TYPE;

SQL_Tx := StringReplace(SQL_Tx, '<UZAK_ID>', form9.Label2.Caption, [rfReplaceAll, rfIgnoreCase]);
SQL_Tx := StringReplace(SQL_Tx, '<DEP_ID>', ELEM_DEP, [rfReplaceAll, rfIgnoreCase]);
SQL_Tx := StringReplace(SQL_Tx, '<TYPE_DEP_ID>', ELEM_DEP_TYPE, [rfReplaceAll, rfIgnoreCase]);
SQL_Tx := StringReplace(SQL_Tx, '<SP_ID>', dbgrideh1.DataSource.DataSet.FieldByName('SPRAV_ID').asString, [rfReplaceAll, rfIgnoreCase]);

SQL_Zam := StringReplace(SQL_Zam, '<UZAK_ID>', form9.Label2.Caption, [rfReplaceAll, rfIgnoreCase]);
SQL_Zam := StringReplace(SQL_Zam, '<DEP_ID>', ELEM_DEP, [rfReplaceAll, rfIgnoreCase]);
SQL_Zam := StringReplace(SQL_Zam, '<TYPE_DEP_ID>', ELEM_DEP_TYPE, [rfReplaceAll, rfIgnoreCase]);
SQL_Zam := StringReplace(SQL_Zam, '<STYPE_DEP_ID>', ELEM_DEP_STYPE, [rfReplaceAll, rfIgnoreCase]);
SQL_Zam := StringReplace(SQL_Zam, '<SPRAV_ID>', dbgrideh1.DataSource.DataSet.FieldByName('SPRAV_ID').asString, [rfReplaceAll, rfIgnoreCase]);

SQL_Zams := StringReplace(SQL_Zams, '<UZAK_ID>', form9.Label2.Caption, [rfReplaceAll, rfIgnoreCase]);
SQL_Zams := StringReplace(SQL_Zams, '<SPRAV_ID>', dbgrideh1.DataSource.DataSet.FieldByName('SPRAV_ID').asString, [rfReplaceAll, rfIgnoreCase]);

Application.CreateForm(Tzams, zams);

zams.OraQueryTX.Close;
zams.OraQueryTX.SQL.Text := SQL_Tx;

zams.OraQuery.Close;
zams.OraQuery.SQL.Text := SQL_Zam;
zams.ZAM_FLAG := dbgrideh1.DataSource.DataSet.FieldByName('ZAM_FLAG').asString;

zams.OraQueryZams.Close;
zams.OraQueryZams.SQL.Text := SQL_Zams;

zams.Caption := 'Тех. комплект/Позиции/Замены/Заменили по: ' + dbgrideh1.DataSource.DataSet.FieldByName('KOD').asString;

zams.ShowModal();
zams.Free;

end;

procedure TDIF_OTCH_FORM.DBGridEh1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
filter_type.Visible := false;
combobox1.Visible := true;
end;

procedure TDIF_OTCH_FORM.DBGridEh1TitleClick(Column: TColumnEh);
var dummy: TObject;
begin

if MessageDlg('Пересортировать список по ' + Column.Title.Caption + '?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  exit;

SORT_FIELD := Column.Field.FieldName;

if SORT_TYPE = 'ASC' then
  SORT_TYPE := 'DESC'
else
  SORT_TYPE := 'ASC';

dummy := nil;
CalcDeficit(dummy);

end;

procedure TDIF_OTCH_FORM.Image1Click(Sender: TObject);
begin

if filter_query.Visible then
begin
  FILTER_MASK := '(1 = 1)';
  SFILTER_MASK := '(1 = 1)';
  cbt_filter.Visible := false;
  filter_query.Visible := false;
end
else
begin
  parseFilterMask;
  cbt_filter.Visible := true;
  filter_query.Visible := true;
  filter_query.SetFocus; 
end;

end;

procedure TDIF_OTCH_FORM.ParseFilterMask;
var filter_field, sfilter_field : string;
begin
  if length(filter_query.text) < 1 then
    exit;

  if cbt_filter.ItemIndex = 0 then
  begin
    filter_field := 'potr.KOD';
    sfilter_field := 'Y.KOD';
  end
  else
  begin
    filter_field := 'LOWER(potr.MTR_NAME)';
    sfilter_field := 'LOWER(Y.MTR_NAME)';
  end;

  FILTER_MASK := filter_field + ' like LOWER(' + chr(39) + filter_query.Text + chr(39) + ')';
  SFILTER_MASK := sfilter_field + ' like lower(' + chr(39) + filter_query.Text + chr(39) + ')';
end;

procedure TDIF_OTCH_FORM.filter_queryChange(Sender: TObject);
begin
parseFilterMask;
end;

procedure TDIF_OTCH_FORM.cbt_filterClick(Sender: TObject);
begin
parseFilterMask;
end;

procedure TDIF_OTCH_FORM.Image2Click(Sender: TObject);
var dummy: TObject;
begin
dummy := nil;
CalcDeficit(dummy);
end;

end.
