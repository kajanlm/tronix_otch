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
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure CalcDeficit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
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

(*
if Form15.Edit5.text = '%' then
  ELEM_DEP := '1'
else
  ELEM_DEP := '(SELECT DISTINCT DEP_ID FROM KADRY_DEP WHERE NOMER = '+#39+Form15.Edit5.Text+#39+')';
*)

case cb_TypeElms.ItemIndex of
  0 : ELEM_TYPE := 'tronix_select_mat(TRONIX_SPRAV.tree_tree_id, ''01'' ) = 0 AND NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) <> 1';
  1 : ELEM_TYPE := 'tronix_select_mat(TRONIX_SPRAV.tree_tree_id, ''01'' ) = 1 AND NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) <> 1';
  2 : ELEM_TYPE := 'NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) = 1';
  3 : ELEM_TYPE := '1=1';
else
  ELEM_TYPE := '1=1';
end;

SQL := StringReplace(SQL, '<UZAK_ID>', form9.Label2.Caption, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<DEP_ID>', ELEM_DEP, [rfReplaceAll, rfIgnoreCase]);
SQL := StringReplace(SQL, '<SQL_FOR_TYPE_ELEMS>', ELEM_TYPE, [rfReplaceAll, rfIgnoreCase]);

//!!«¿Ã≈Õ€ ¬ Œ¡≈ —“Œ–ŒÕ€ («¿Ã≈Õ»À» Õ¿, «¿Ã≈Õ»ÀŒ ÃÕŒﬁ “Œ “Œ...)!!

showmessage(SQL);
//edit2.Text := SQL;

OraQuery.Close;
OraQuery.SQL.Text := SQL;
OraQuery.ExecSQL;

LOCK_BOX.Visible := false;

Button1.Enabled := true;

//DataSet.Delta := OraQuery.Delta;

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

end;   //36840-4789, 2 = 32050     12800 - 1495 =  11305 ( + 19200)

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

procedure TDIF_OTCH_FORM.FormShow(Sender: TObject);
begin
(* *)
end;

end.
