unit Reserve_Msch_Cks_Place;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TFReserve_Msch_Cks_Place = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1place: TStringField;
    OraQuery1kod: TStringField;
    OraQuery1zavn: TStringField;
    OraQuery1kol: TFloatField;
    OraQuery1namek: TStringField;
    OraQuery1name: TStringField;
    OraQuery1skl: TStringField;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReserve_Msch_Cks_Place: TFReserve_Msch_Cks_Place;

implementation

{$R *.dfm}

procedure TFReserve_Msch_Cks_Place.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);

tx:=' ';
tx:=tx+'select l.place as place,l.kod as kod,l.zavn as zavn,l.kol as kol,l.namek as namek,l.name as name,l.skl as skl';
tx:=tx+' FROM (';
tx:=tx+' select d.nomer skl, S.kod kod, pr.zavn zavn,z.mesto place,';
tx:=tx+' sum(round(z.kol_uchet,4)) kol,kd.namek namek,replace(replace(tronix_sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') name';
tx:=tx+' from tronix.sprav s,tronix_zapas z,tronix_koded kd,';
tx:=tx+' tronix.project_list pr,feb_zakaz zk, kadry_dep d';
tx:=tx+' WHERE z.sprav_sprav_id=s.sprav_id(+) and nvl(s.can_do_self,0)=1';
tx:=tx+' and kd.koded_id=z.koded_koded_id_uchet and d.dep_id=z.dep_dep_id(+)';
tx:=tx+' and d.nomer=''÷ —-25'' and z.uzak_uzak_id=zk.nn(+) and zk.id_project=pr.project_id(+)';

if edit1.text<>'All' then
tx:=tx+' and pr.project_id='+edit1.text;

tx:=tx+' group by d.nomer,z.mesto,s.kod, pr.zavn, kd.namek, replace(replace(tronix_sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '')';
tx:=tx+' ) l';

//ShowMEssage(tx);

  With OraQuery1 Do
     begin
        FieldByName('place').DisplayLAbel:='ﬂ◊≈… ¿ ';
        FieldByName('kod').DisplayLAbel:=' Œƒ »«ƒ-»ﬂ';
        FieldByName('zavn').DisplayLAbel:='«¿¬.π ';
        FieldByName('kol').DisplayLAbel:=' ŒÀ-¬Œ ';
        FieldByName('namek').DisplayLAbel:='≈ƒ.»«Ã. ';
        FieldByName('name').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ »«ƒ≈À»ﬂ Ã—◊';
        FieldByName('skl').DisplayLAbel:='— À¿ƒ ';
    end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TFReserve_Msch_Cks_Place.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFReserve_Msch_Cks_Place.Button1Click(Sender: TObject);
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


procedure TFReserve_Msch_Cks_Place.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    if (Column.FieldName='kol') and (Column.Field.Dataset.FieldByName('kol').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
