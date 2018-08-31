unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, ExcelXP, OleServer,
  StdCtrls,DBGridEhImpExp, GridsEh, DBGrids, DBClient, ExtCtrls;

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
    OraQueryDATE_DEFICIT0: TStringField;
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
    cb_typeelms: TComboBox;
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
  private
    { Private declarations }
    procedure Execute_SQL(SQL: string);
  public
    { Public declarations }
  end;

var
  DIF_OTCH_FORM: TDIF_OTCH_FORM;

implementation

uses Unit15, Unit5, Unit9;

{$R *.dfm}

procedure TDIF_OTCH_FORM.CalcDeficit(Sender: TObject);
var

SQL,
ELEM_DEP,
ELEM_DEP_TYPE,
ELEM_TYPE
: string;

f
: textfile;

begin

//exit;

AssignFile(f, 'c:\SQL_FROM_MTR_EX.sql');
Reset(f);
readln(f, SQL);
closefile(f);

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


case cb_TypeElms.ItemIndex of
  0 : ELEM_TYPE := 'tronix_select_mat(TRONIX_SPRAV.tree_tree_id, ''01'' ) = 0 AND NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) <> 1';
  1 : ELEM_TYPE := 'tronix_select_mat(TRONIX_SPRAV.tree_tree_id, ''01'' ) = 1 AND NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) <> 1';
  2 : ELEM_TYPE := 'NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) = 1';
  3 : ELEM_TYPE := '1 = 1';
else
  ELEM_TYPE := '1 = 1';
end;

SQL := StringReplace(SQL, '<UZAK_ID>', form9.Label2.Caption, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<DEP_ID>', ELEM_DEP, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<TYPE_DEP_ID>', ELEM_DEP_TYPE, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<TYPE_ELEMS>', ELEM_TYPE, [rfReplaceAll, rfIgnoreCase]);

//!!«¿Ã≈Õ€ ¬ Œ¡≈ —“Œ–ŒÕ€ («¿Ã≈Õ»À» Õ¿, «¿Ã≈Õ»ÀŒ ÃÕŒﬁ “Œ “Œ...)!!
//œ–Œ¬≈–»“‹ ‘»À‹“–¿÷»ﬁ œŒ “»œ” (Ã—◊, Œ¡Œ–”ƒ. » “.ƒ.)!!!

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

(*
OraQuery.First;
DataSet.Insert;
while OraQuery.Eof do
begin
  DataSet.FieldByName('KOD').Value :=                  OraQuery.FieldByName('KOD').Value;
  DataSet.FieldByName('MTR_NAME').Value :=             OraQuery.FieldByName('MTR_NAME').Value;
  DataSet.FieldByName('POTR').Value :=                 OraQuery.FieldByName('POTR').Value;
  DataSet.FieldByName('ED').Value :=                   OraQuery.FieldByName('ED').Value;
  DataSet.FieldByName('POTR_UCHET').Value :=           OraQuery.FieldByName('POTR_UCHET').Value;
  DataSet.FieldByName('ED_UCHET').Value :=             OraQuery.FieldByName('ED_UCHET').Value;
  DataSet.FieldByName('ZAPAS_POST').Value :=           OraQuery.FieldByName('ZAPAS_POST').Value;
  DataSet.FieldByName('ZAPAS_POST_UCHET').Value :=     OraQuery.FieldByName('ZAPAS_POST_UCHET').Value;
  DataSet.FieldByName('ZAPAS_POST_SUB').Value :=       OraQuery.FieldByName('ZAPAS_POST_SUB').Value;
  DataSet.FieldByName('ZAPAS_POST_SUB_UCHET').Value := OraQuery.FieldByName('ZAPAS_POST_SUB_UCHET').Value;
  DataSet.FieldByName('DEFICIT').Value :=              OraQuery.FieldByName('DEFICIT').Value;
  DataSet.FieldByName('DEFICIT_UCHET').Value :=        OraQuery.FieldByName('DEFICIT_UCHET').Value;
  DataSet.FieldByName('DATE_DEFICIT0').Value :=        OraQuery.FieldByName('DATE_DEFICIT0').Value;

  OraQuery.Next;
  DataSet.Append;
end;
*)

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
  Execute_SQL('SELECT * FROM KADRY_DEP WHERE TYPE_DEP_TYPE_DEP_ID = ' + cb_invi_typepodr.Items[cb_typepodr.ItemIndex]);

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

end.
