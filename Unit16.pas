unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, ExcelXP, OleServer,
  StdCtrls,DBGridEhImpExp, GridsEh, DBGrids, DBClient, ExtCtrls, CheckLst,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

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
    OraQueryDEFICIT: TFloatField;
    OraQueryDEFICIT_UCHET: TFloatField;
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
    DBGrid1: TDBGrid;
    OraDataSource1: TOraDataSource;
    OraQueryS: TOraQuery;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    cb_invi_typepodr: TComboBox;
    cb_invi_podr: TComboBox;
    cb_invi_podr_name: TComboBox;
    filter_type: TCheckListBox;
    ComboBox1: TComboBox;
    IdHTTP1: TIdHTTP;
    OraQuerySPRAV_ID: TFloatField;
    OraQueryZAM_FLAG: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure CalcDeficit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  private
    { Private declarations }
    procedure Execute_SQL(SQL: string);
    function ServerRequest(s : string) : string;
  public
    function SCAlive : boolean;
    { Public declarations }
  end;

const
SERVER_ADDR = 'http://192.168.10.15:7777/server/tronix_otch/';
SERVER_FILE_PART = '.sql';

var
  DIF_OTCH_FORM: TDIF_OTCH_FORM;
  ELEM_DEP,
  ELEM_DEP_TYPE,
  ELEM_TYPE
  : string;

implementation

uses Unit15, Unit5, Unit9, addzams;

{$R *.dfm}

function TDIF_OTCH_FORM.SCAlive : boolean;
begin

try
  idhttp1.Get(SERVER_ADDR + 'dummy');
except
  showmessage('Œ¯Ë·Í‡ ÒÓÂ‰ËÌÂÌËˇ Ò ÒÂ‚ÂÓÏ!');
  SCAlive := false;
  exit;
end;

SCAlive := true;
end;

function TDIF_OTCH_FORM.ServerRequest(s : string) : string;
begin
try
  ServerRequest := idhttp1.Get(SERVER_ADDR + s + SERVER_FILE_PART);
except
  showmessage('ERROR');
  Application.Terminate;
end;
end;

procedure TDIF_OTCH_FORM.CalcDeficit(Sender: TObject);
var

SQL
: string;

begin

if SCAlive then
  SQL := ServerRequest('DEFICIT')
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

(*
case cb_TypeElms.ItemIndex of
  0 : ELEM_TYPE := 'tronix_select_mat(TRONIX_SPRAV.tree_tree_id, ''01'' ) = 0 AND NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) <> 1';
  1 : ELEM_TYPE := 'tronix_select_mat(TRONIX_SPRAV.tree_tree_id, ''01'' ) = 1 AND NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) <> 1';
  2 : ELEM_TYPE := 'NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) = 1';
  3 : ELEM_TYPE := '1 = 1';
else
  ELEM_TYPE := '1 = 1';
end;
*)

ELEM_TYPE := '(';

if filter_type.Checked[0] then
  ELEM_TYPE := ELEM_TYPE + '(tronix_select_mat(TRONIX_SPRAV.tree_tree_id, ''01'' ) = 1 AND NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) <> 1) or ';

if filter_type.Checked[1] then
  ELEM_TYPE := ELEM_TYPE + '(tronix_select_mat(TRONIX_SPRAV.tree_tree_id, ''01'' ) = 0 AND NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) <> 1) or '
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

SQL := StringReplace(SQL, '<UZAK_ID>', form9.Label2.Caption, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<DEP_ID>', ELEM_DEP, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<TYPE_DEP_ID>', ELEM_DEP_TYPE, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<TYPE_ELEMS>', ELEM_TYPE, [rfReplaceAll, rfIgnoreCase]);

//!!«¿Ã≈Õ€ ¬ Œ¡≈ —“Œ–ŒÕ€ («¿Ã≈Õ»À» Õ¿, «¿Ã≈Õ»ÀŒ ÃÕŒﬁ “Œ “Œ...)!!

showmessage(SQL);

OraQuery.Close;
OraQuery.SQL.Text := SQL;
OraQuery.ExecSQL;

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

procedure TDIF_OTCH_FORM.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if Column.FieldName = 'DATE_DEFICIT0' then
  begin
    if Column.Field.Dataset.FieldByName('DATE_DEFICIT0').AsString = '' then
      background := clYellow
    else
      background := clRed;
  end;

end;

procedure TDIF_OTCH_FORM.Execute_SQL(SQL: string);
begin
LOCK_BOX.Visible := true;

edit1.Text := SQL;

OraQueryS.Close;
OraQueryS.SQL.Text := SQL;
OraQueryS.Open;
end;

procedure TDIF_OTCH_FORM.Button3Click(Sender: TObject);
begin
OraQueryS.Close;
OraQueryS.SQL.Text := Edit2.Text;
OraQueryS.Open;
end;

procedure TDIF_OTCH_FORM.Button2Click(Sender: TObject);
begin
edit2.text := '';
end;

procedure TDIF_OTCH_FORM.FormShow(Sender: TObject);
begin

cb_typepodr.Clear;
cb_podr.Clear;

cb_invi_typepodr.Clear;
cb_invi_podr.Clear;

Execute_SQL('SELECT * FROM KADRY_TYPE_DEP WHERE KOD in (''01'', ''02'', ''04'', ''05'', ''07'', ''08'') ORDER BY NAME ASC');

cb_typepodr.Items.Add('«‡‚Ó‰');
cb_invi_typepodr.Items.Add('ZAVOD');

OraQueryS.First;
while not OraQueryS.Eof do
begin
  cb_typepodr.Items.Add(OraQueryS.FieldByName('NAME').asString);
  cb_invi_typepodr.Items.Add(OraQueryS.FieldByName('type_dep_id').asString);

  OraQueryS.Next;
end;

cb_typepodr.ItemIndex := 0;
cb_podr.Items.Add('ﬂ—«');
cb_podr.ItemIndex := 0;
edit1.Text := 'ﬂÓÒÎ‡‚ÒÍËÈ ÒÛ‰ÓÒÚÓËÚÂÎ¸Ì˚È Á‡‚Ó‰';

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
  cb_podr.Items.Add('ﬂ—«');
  cb_podr.ItemIndex := 0;
  edit1.Text := 'ﬂÓÒÎ‡‚ÒÍËÈ ÒÛ‰ÓÒÚÓËÚÂÎ¸Ì˚È Á‡‚Ó‰';
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

procedure TDIF_OTCH_FORM.filter_typeClick(Sender: TObject);
begin
if ((not filter_type.Checked[0]) and (not filter_type.Checked[1]) and (not filter_type.Checked[2])) then
  filter_type.Checked[3] := true;

if ((filter_type.Checked[0]) or (filter_type.Checked[1]) or (filter_type.Checked[2])) then
  filter_type.Checked[3] := false;
  
LOCK_BOX.Visible := true;
end;

procedure TDIF_OTCH_FORM.filter_typeClickCheck(Sender: TObject);
begin
if ((not filter_type.Checked[0]) and (not filter_type.Checked[1]) and (not filter_type.Checked[2])) then
  filter_type.Checked[3] := true;

if ((filter_type.Checked[0]) or (filter_type.Checked[1]) or (filter_type.Checked[2])) then
  filter_type.Checked[3] := false;

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

SQL,
SQL_Zam,
ELEM_DEP_STYPE
: string;

begin

if SCAlive then
  SQL := ServerRequest('_ZAMENY') //_ZAMENY
else
  exit;

//showmessage('FLAGS [Deficit = ' + dbgrideh1.DataSource.DataSet.FieldByName('FLAG_DEFICIT0').asString + ', Zam = ' + dbgrideh1.DataSource.DataSet.FieldByName('ZAM_FLAG').asString + ']');

if ELEM_DEP_TYPE = '1 = 1' then
  ELEM_DEP_STYPE := 'TYPE_DEP_TYPE_DEP_ID is not null or (1 = 1)'
else
  ELEM_DEP_STYPE := ELEM_DEP_TYPE;

SQL := StringReplace(SQL, '<UZAK_ID>', form9.Label2.Caption, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<DEP_ID>', ELEM_DEP, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<TYPE_DEP_ID>', ELEM_DEP_TYPE, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<STYPE_DEP_ID>', ELEM_DEP_STYPE, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<SPRAV_ID>', dbgrideh1.DataSource.DataSet.FieldByName('SPRAV_ID').asString, [rfReplaceAll, rfIgnoreCase]);

showmessage(SQL);

if SCAlive then
  SQL_Zam := ServerRequest('ZAMENY_')
else
  exit;

SQL_Zam := StringReplace(SQL_Zam, '<UZAK_ID>', form9.Label2.Caption, [rfReplaceAll, rfIgnoreCase]);
SQL_Zam := StringReplace(SQL_Zam, '<DEP_ID>', ELEM_DEP, [rfReplaceAll, rfIgnoreCase]);
SQL_Zam := StringReplace(SQL_Zam, '<TYPE_DEP_ID>', ELEM_DEP_TYPE, [rfReplaceAll, rfIgnoreCase]);
SQL_Zam := StringReplace(SQL_Zam, '<STYPE_DEP_ID>', ELEM_DEP_STYPE, [rfReplaceAll, rfIgnoreCase]);
SQL_Zam := StringReplace(SQL_Zam, '<SPRAV_ID>', dbgrideh1.DataSource.DataSet.FieldByName('SPRAV_ID').asString, [rfReplaceAll, rfIgnoreCase]);

//œ≈–≈¬Œƒ ¬Õ”“–» SQL'‡ — —Œ’–¿Õ≈Õ»≈Ã  Œƒ»–Œ¬ » –”—— »’ —»Ã¬ŒÀŒ¬ (œŒ¬“Œ–Õ€… œ≈–≈’¬¿“)

showmessage(SQL_Zam);

Application.CreateForm(Tzams, zams);

//  08628212000 <- 08628606000

zams.OraQuery.Close;
zams.OraQuery.SQL.Text := SQL;
zams.ZAM_FLAG := dbgrideh1.DataSource.DataSet.FieldByName('ZAM_FLAG').asString;

zams.OraQueryZams.Close;
zams.OraQueryZams.SQL.Text := SQL_Zam;

zams.ShowModal();
zams.Free;

end;

procedure TDIF_OTCH_FORM.DBGridEh1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
filter_type.Visible := false;
combobox1.Visible := true;
end;

end.
