unit ftrnomen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, Ora, StdCtrls, ExtCtrls, ExcelXP, OleServer, DBGridEhImpExp;

type
  Ttrnomen = class(TForm)
    DBGridEh1: TDBGridEh;
    OraDataSource1: TOraDataSource;
    OraQueryS: TOraQuery;
    OraQuerySKOD: TStringField;
    OraQuerySNOMER: TStringField;
    OraQuerySTYPE: TStringField;
    OraQuerySCEH: TStringField;
    OraQuerySKOL_UCHET: TFloatField;
    OraQuerySKOL: TFloatField;
    OraQuerySDATE1: TStringField;
    OraQuerySDATE2: TStringField;
    OraQuerySDATE3: TStringField;
    OraQuerySDATEC: TStringField;
    needColor: TCheckBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    OraQuerySSKLAD: TStringField;
    OraQuerySVYD: TStringField;
    OraQuerySCHERT: TStringField;
    OraQuerySPUE: TStringField;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure needColorClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    addLabel : boolean;
  public
    { Public declarations }
  end;

var
  trnomen: Ttrnomen;

implementation

{$R *.dfm}

uses Unit16;

procedure Ttrnomen.FormShow(Sender: TObject);
begin

addLabel := false;
if label5.Visible then
  addLabel := true;

OraQueryS.Open;
end;

procedure Ttrnomen.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (((Column.FieldName = 'DATE1') or (Column.FieldName = 'DATE2') or (Column.FieldName = 'DATE3')) and needColor.Checked) then
  begin

    if Column.Field.DataSet.FieldByName('DATE1').asString = '' then
      dbgrideh1.canvas.brush.color := TColor(RGB(200, 0, 0)) //red
    else
    if Column.Field.DataSet.FieldByName('DATE2').asString = '' then
      dbgrideh1.canvas.brush.color := TColor(RGB(255, 200, 33))   //yellow
    else
    if Column.Field.DataSet.FieldByName('DATE3').asString = '' then
      dbgrideh1.Canvas.Brush.Color := clOlive   // 128 128 0
    else
      dbgrideh1.Canvas.Brush.Color := TColor(RGB(33, 255, 0)); //green

    dbgrideh1.DefaultDrawColumnCell(rect, DataCol, Column, State);
    
  end;
end;

procedure Ttrnomen.needColorClick(Sender: TObject);
begin
if needColor.Checked then
begin

  if addLabel then
    Label5.Visible := false;

  label1.Visible := true;
  label2.Visible := true;
  label3.Visible := true;
  label4.Visible := true;

  panel1.Visible := true;
  panel2.Visible := true;
  panel3.Visible := true;
  panel4.Visible := true;
end
else
begin

  if addLabel then
    Label5.Visible := true;

  label1.Visible := false;
  label2.Visible := false;
  label3.Visible := false;
  label4.Visible := false;

  panel1.Visible := false;
  panel2.Visible := false;
  panel3.Visible := false;
  panel4.Visible := false;
end;

dbgrideh1.Refresh;
end;

procedure Ttrnomen.Button1Click(Sender: TObject);
var
NFile: string;
HFile: Textfile;
begin

  SaveDialog1.FileName := DIF_OTCH_FORM.Caption + '.txt';

  if not SaveDialog1.Execute then
  begin
    showmessage('Ошибка вывода');
    exit;
  end;

  NFile := SaveDialog1.FileName;
  AssignFile(HFile, NFile);
  Rewrite(HFile);

  dbgrideh1.DataSource.DataSet.First;

  while not dbgrideh1.DataSource.DataSet.Eof do
  begin
    Writeln(HFile, dbgrideh1.DataSource.DataSet.FieldByName('KOD').asString + '$' + dbgrideh1.DataSource.DataSet.FieldByName('VYD').asString + '$' +
    dbgrideh1.DataSource.DataSet.FieldByName('NOMER').asString + '$' +
    dbgrideh1.DataSource.DataSet.FieldByName('TYPE').asString + '$' +
    dbgrideh1.DataSource.DataSet.FieldByName('SKLAD').asString + '$' + dbgrideh1.DataSource.DataSet.FieldByName('CEH').asString + '$' +
    dbgrideh1.DataSource.DataSet.FieldByName('KOL_UCHET').asString + '$' + dbgrideh1.DataSource.DataSet.FieldByName('KOL').asString + '$' +
    dbgrideh1.DataSource.DataSet.FieldByName('DATEC').asString + '$' + dbgrideh1.DataSource.DataSet.FieldByName('DATE1').asString + '$' +
    dbgrideh1.DataSource.DataSet.FieldByName('DATE2').asString + '$' + dbgrideh1.DataSource.DataSet.FieldByName('DATE3').asString + '$' +
    dbgrideh1.DataSource.DataSet.FieldByName('PUE').asString + '$' + dbgrideh1.DataSource.DataSet.FieldByName('CHERT').asString);
    dbgrideh1.DataSource.DataSet.Next;
  end;

  closefile(HFile);
end;

procedure Ttrnomen.Button2Click(Sender: TObject);
var
ExcelApplication:TExcelApplication;
Range, Sheet: VAriant;
begin
  SaveDialog1.FileName := DIF_OTCH_FORM.Caption;
  ExcelApplication := TExcelApplication.Create(Self);
  ExcelApplication.ConnectKind := ckNewInstance;
  ExcelApplication.Connect;
  ExcelApplication.AutoQuit := true;
  ExcelWorkbook1.ConnectTo(ExcelApplication.Workbooks.Add(EmptyParam, LOCALE_USER_DEFAULT));
  ExcelWorkBook1.Activate(LOCALE_USER_DEFAULT);
  ExcelWorksheet1.ConnectTo(ExcelApplication.ActiveWorkbook.ActiveSheet as ExcelWorkSheet);

  Sheet := ExcelWorkbook1.Sheets[1];
  Range := Sheet.Columns;

  with SaveDialog1 do
    begin
      InitialDir :=ExtractFilePath(Application.ExeName);
      Filter :='Exell files (*.xls)|*.xls|All files (*.*)|*.*';
      if SaveDialog1.Execute then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS, DBGridEh1, SaveDialog1.FileName+ '.xls' ,true);
      end;
  end;
end;

end.
