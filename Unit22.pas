unit Unit22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, DBGridEhImpExp,ExcelXP,
  OleServer, GridsEh;

type
  TForm22 = class(TForm)
    Edit1: TEdit;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    OraQuery1Field: TStringField;
    OraQuery1ident: TStringField;
    OraQuery1poz: TStringField;
    OraQuery1podpoz: TStringField;
    OraQuery1rp: TStringField;
    OraQuery1kod: TStringField;
    OraQuery1namek: TStringField;
    OraQuery1kol: TFloatField;
    OraQuery1tnnomer: TStringField;
    OraQuery1tndatedok: TStringField;
    OraQuery1tndateins: TStringField;
    OraQuery1ednamek: TStringField;
    OraQuery1koluchet: TFloatField;
    OraQuery1ednamek1: TStringField;
    OraQuery1koluchet1: TFloatField;
    OraQuery1tnn: TStringField;
    OraQuery1Doc_prih: TStringField;
    OraQuery2: TOraQuery;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    SaveDialog1: TSaveDialog;
    OraQuery1tndatedok2: TStringField;
    OraQuery1tndatedok4: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OraQuery1CalcFields(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation

{$R *.dfm}

procedure TForm22.FormShow(Sender: TObject);
var tx:string;
begin

tx:='select l.zavn, l.ident, l.poz, l.podpoz, l.rp,';
tx:=tx+'  l.kod,l.namek, l.kol,  ';
tx:=tx+' l.tnnomer, l.tndatedok, l.tndateins, l.ednamek, l.koluchet , l.ednamek1, l.koluchet1, l.tnn ,l.tndatedok2,l.tndatedok4 ';
tx:=tx+'from ';
tx:=tx+'( ';
tx:=tx+' select z.zavn, do.ident, ss.poz, ss.podpoz, replace(tronix_sp_name(sp.sprav_id), chr(10), '' '') rp,';
tx:=tx+'  sp.kod,ed.namek, ss.kol,     ';
tx:=tx+'   '' '' tnnomer,'' '' tndatedok, '' '' tndateins,'' '' tndatedok2,'' '' tndatedok4,'' '' ednamek, 0 koluchet,    ';
tx:=tx+'  '' '' ednamek1,0 koluchet1,   ';
tx:=tx+'  (replace(tx_get_ttn( sp.sprav_id,do.id_project,''ALL''), chr(10), '' '')) tnn ';
tx:=tx+'from tronix.document do,       ';
tx:=tx+'  tronix.sp ss,           ';
tx:=tx+' tronix.sprav sp,         ';
tx:=tx+' tronix.koded ed,         ';
tx:=tx+'  tronix.project_list z     ';
tx:=tx+'where do.id_document_type=18   ';
tx:=tx+'  and sp.sprav_id(+)=ss.id_sprav   ';
tx:=tx+' and ss.nnn=do.document_id      ';
tx:=tx+' and do.id_project=z.project_id(+)    ';
tx:=tx+' and z.project_id='+Edit1.Text;
tx:=tx+' and z.date_end is null       ';
tx:=tx+'  and ed.koded=ss.kode       ';
tx:=tx+' and ss.id_sprav not in      ';
tx:=tx+' (   ';
tx:=tx+'select distinct tm.sprav_sprav_id ';
tx:=tx+'from tronix.ttn tn,tronix.ttn_mat tm,tronix.project_list z ';
tx:=tx+'where tn.dep_dep_id_to in (8024,8026) ';
tx:=tx+'      and tn.type_ttn_type_ttn_id=44    ';
tx:=tx+'      and tm.ttn_ttn_id=tn.ttn_id   ';
tx:=tx+'      and tn.project_project_id=z.project_id(+)  ';
tx:=tx+'      and z.project_id='+Edit1.Text;
tx:=tx+') ';
tx:=tx+'union all';
tx:=tx+' select ll.zavn,ll.ident, ll.poz, ll.podpoz,ll.rp,ll.kod, ll.namek, ll.kol,   ';
tx:=tx+'       ll.tnnomer tnnomer,   ';
tx:=tx+'       ll.tndatedok tndatedok,    ';
tx:=tx+'       ll.tndateins tndateins,  ll.tndatedok2 , ll.tndatedok4 ,   ';
tx:=tx+'       ll.ednamek ednamek,ll.koluchet koluchet,    ';
tx:=tx+'       ll.ednamek1 ednamek1,ll.koluchet1 koluchet1,   ';
tx:=tx+'       ll.tnn tnn   ';
tx:=tx+'from   ';
tx:=tx+'(  ';
tx:=tx+'select z.zavn,do.ident, ss.poz, ss.podpoz,replace(tronix_sp_name(sp.sprav_id), chr(10), '' '') rp,    ';
tx:=tx+'        sp.kod, edd.namek, ss.kol,    ';
tx:=tx+'       tn.nomer tnnomer,  ';
tx:=tx+'       to_char( tn.date_dok, ''DD.MM.YYYY'' ) tndatedok,   ';
tx:=tx+'       to_char( tn.date_ins, ''DD.MM.YYYY'' ) tndateins, to_char( tn.user_date2, ''DD.MM.YYYY'' ) tndatedok2, ';
tx:=tx+'       to_char( tn.user_date4, ''DD.MM.YYYY'' ) tndatedok4,';
tx:=tx+'       ed.namek ednamek,sum(tm.kol_uchet) koluchet,  ';
tx:=tx+'       edd.namek ednamek1,sum(ROUND(tm.KOL_uchet*tronix_kof_koded(sp.sprav_id,tm.koded_koded_id_uchet,edd.koded_id),4)) koluchet1,';
tx:=tx+'      (replace(tx_get_ttn( sp.sprav_id,tn.project_project_id,''ALL''), chr(10), '' '')) tnn           ';
tx:=tx+'from tronix.ttn tn,   ';
tx:=tx+'     tronix.ttn_mat tm,';
tx:=tx+'     tronix.sprav sp,  ';
tx:=tx+'     tronix.koded ed,';
tx:=tx+'     tronix.koded edd, ';
tx:=tx+'     tronix.sp ss,      ';
tx:=tx+'     tronix.document do,  ';
tx:=tx+'     tronix.project_list z  ';
tx:=tx+'where tn.dep_dep_id_to in (8024,8026)   ';
tx:=tx+'      and tn.type_ttn_type_ttn_id=44  ';
tx:=tx+'      and tm.ttn_ttn_id=tn.ttn_id     ';
tx:=tx+'      and tm.sprav_sprav_id=sp.sprav_id(+) ';
tx:=tx+'      and tm.koded_koded_id_uchet=ed.koded_id(+) ';
tx:=tx+'      and ss.id_sprav=tm.sprav_sprav_id   ';
tx:=tx+'      and ss.nnn=do.document_id     ';
tx:=tx+'      and tn.project_project_id=do.id_project  ';
tx:=tx+'      and z.project_id=tn.project_project_id   ';
tx:=tx+'      and z.project_id='+Edit1.Text;
tx:=tx+'      and z.date_end is null       ';
tx:=tx+'      and edd.koded=ss.kode        ';
tx:=tx+'group by z.zavn,do.ident,ss.poz,ss.podpoz,sp.kod,ss.kol,tn.date_ins,tn.nomer,ed.namek,edd.namek,      ';
tx:=tx+'        to_char( tn.date_dok, ''DD.MM.YYYY'' ), ';
tx:=tx+'        to_char( tn.date_ins, ''DD.MM.YYYY'' ), to_char( tn.user_date2, ''DD.MM.YYYY'' ),to_char( tn.user_date4, ''DD.MM.YYYY'' ),  ';
tx:=tx+'        replace(tronix_sp_name(sp.sprav_id), chr(10), '' ''),                                         ';
tx:=tx+'        replace(tx_get_ttn( sp.sprav_id,tn.project_project_id,''ALL''), chr(10), '' '')               ';
tx:=tx+') ll   ';
tx:=tx+') l ';
tx:=tx+'order by l.zavn,l.ident, l.poz, l.podpoz,l.rp,l.kod, l.namek, l.kol,l.tndateins,l.tnnomer,l.ednamek,l.ednamek1 ';
ORAQuery1.SQL.Text:=tx;
//ShowMessage(ORAQuery1.SQL.Text);

ORAQuery1.ExecSQL;

end;

procedure TForm22.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ORAQuery1.Close;
  ORAQuery2.Close;
end;

procedure TForm22.OraQuery1CalcFields(DataSet: TDataSet);
var tx,ya:string;
begin

  ya:='';
tx:='Select ''№''||ttn.nomer||'' Проведен ''||'' ''||to_char(ttn.date_ins, ''DD.MM.YYYY'')||'' ''||(Select name from nordsy.dep where dep_id=ttn.dep_dep_id_to) ||'' в кол ''||tmat.kol  ya from tronix.ttn ttn, tronix.ttn_mat tmat, tronix.sprav sp';
tx:=tx+' where tmat.sprav_sprav_id=sp.sprav_id ';
tx:=tx+' and tmat.ttn_ttn_id=ttn.ttn_id ';
tx:=tx+'and sp.kod='+#39+oraQuery1.FieldByName('KOD').AsString+#39;
tx:=tx+' and type_ttn_type_ttn_id=1';

ORAQuery2.SQL.Text:=tx;
ORAQuery2.ExecSQL;
 if   ORAQuery2.RecordCount>0 then
  begin
 While ORAQuery2.Eof=false DO begin
     ya:=ya+OraQuery2.FieldByName('ya').AsString+'  ';
    ORAQuery2.Next;
 end;
   oraQuery1.FieldByName('DOC_prih').Value:=ya;
 end;
end;

procedure TForm22.Button1Click(Sender: TObject);
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

end.
