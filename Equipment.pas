unit Equipment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;
 
type
  TFEquipment = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1kod: TStringField;
    OraQuery1name: TStringField;
    OraQuery1kol: TFloatField;
    OraQuery1namek: TStringField;
    OraQuery1massaed: TFloatField;
    OraQuery1massa: TFloatField;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    Button2: TButton;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEquipment: TFEquipment;

implementation

uses Unit9;

{$R *.dfm}

procedure TFEquipment.FormShow(Sender: TObject);
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);

end;

procedure TFEquipment.Button2Click(Sender: TObject);
var tx:string;
begin
tx:='';
tx:=tx+'select tt.kod as kod,tt.denomer as denomer,replace(replace(tt.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') as name,';
tx:=tx+' tt.kol as kol,tt.namek as namek,tt.massaed as massaed,tt.massaed*tt.kol as massa';
tx:=tx+' from(';

tx:=tx+' select t.kod kod,t.denomer denomer,t.name name, sum( t.kol) kol,t.namek namek,max(t.massaed) massaed';
tx:=tx+' from (';

tx:=tx+' select tronix.sp_sp_name(null,p.sp_id_from) poz,s.kod kod,tronix.sp_name(s.sprav_id) name,';
tx:=tx+' ed.namek namek,p.sprav_sprav_id id,round(sum(p.kol),4) kol,max(s.mass) massaed,de.nomer denomer';
tx:=tx+' from nordsy.car_potr p,tronix.sprav s,tronix.koded ed,kadry_dep de,feb_zakaz zk';
tx:=tx+' where p.project_project_id='+edit1.text;
tx:=tx+' and zk.id_project=p.project_project_id and zk.zak not like (''%%(ÌÑ×)'')';
tx:=tx+' and ed.koded_id=p.koded_koded_id';
tx:=tx+' and s.sprav_id=p.sprav_sprav_id';
tx:=tx+' and tronix_select_mat(s.tree_tree_id,''02'')=1';
tx:=tx+' and p.dep_dep_id=de.dep_id';

if CheckBox1.Checked=false then
tx:=tx+' and nvl(s.can_do_self,0)=0';

tx:=tx+' group by tronix.sp_sp_name(null,p.sp_id_from),s.kod,tronix.sp_name(s.sprav_id),ed.namek ,p.sprav_sprav_id ,de.nomer';
tx:=tx+') t';

tx:=tx+' group by t.kod,t.denomer,t.name,t.namek';
tx:=tx+' ) tt';

tx:=tx+' order by tt.kod,tt.denomer';

//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('kod').DisplayLAbel:='ÊÎÄ ';
        FieldByName('denomer').DisplayLAbel:='ÖÅÕ ';
        FieldByName('name').DisplayLAbel:='ÍÀÈÌÅÍÎÂÀÍÈÅ ';
        FieldByName('kol').DisplayLAbel:='ÊÎËÈ×ÅÑÒÂÎ ';
        FieldByName('namek').DisplayLAbel:='ÅÄ.ÈÇÌ. ';
        FieldByName('massaed').DisplayLAbel:='ÌÀÑÑÀ ÅÄÅÍÈÖÛ ';
        FieldByName('massa').DisplayLAbel:='ÌÀÑÑÀ ÂÑÅÃÎ ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;

procedure TFEquipment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFEquipment.Button1Click(Sender: TObject);
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


procedure TFEquipment.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

    if (Column.FieldName='kol') and (Column.Field.Dataset.FieldByName('kol').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='massaed') and (Column.Field.Dataset.FieldByName('massaed').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='massa') and (Column.Field.Dataset.FieldByName('massa').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


end.
