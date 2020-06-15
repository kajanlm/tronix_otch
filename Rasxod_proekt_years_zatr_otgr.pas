unit Rasxod_proekt_years_zatr_otgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls;

type
  TFRasxod_proekt_years_zatr_otgr = class(TForm)
    DBGridEh1: TDBGridEh;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1prizn: TStringField;
    OraQuery1godins: TStringField;
    OraQuery1kodotgr: TStringField;
    OraQuery1kolotgr: TFloatField;
    OraQuery1edotgrosn: TStringField;
    OraQuery1kodzatr: TStringField;
    OraQuery1kolzatr: TFloatField;
    OraQuery1edzatrosn: TStringField;
    OraQuery1nameotgr: TStringField;
    OraQuery1namezatr: TStringField;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRasxod_proekt_years_zatr_otgr: TFRasxod_proekt_years_zatr_otgr;
implementation

uses Unit9;

{$R *.dfm}

procedure TFRasxod_proekt_years_zatr_otgr.FormShow(Sender: TObject);
begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='4011';
//ShowMessage(Form58.Caption);
RadioGroup1.ItemIndex:=0;
end;

procedure TFRasxod_proekt_years_zatr_otgr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFRasxod_proekt_years_zatr_otgr.Button1Click(Sender: TObject);
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

procedure TFRasxod_proekt_years_zatr_otgr.Button2Click(Sender: TObject);
var tx:string;
    tr:string;
begin
tr:='01';
if RadioGroup1.ItemIndex=1 then tr:='02';

tx:=' ';
tx:='select t.prizn as prizn, t.godins as godins,t.kodotgr as kodotgr, sum(t.kolotgr) as kolotgr, t.edotgrosn as edotgrosn,';
tx:=tx+' t.kodzatr as kodzatr,sum(t.kolzatr) as kolzatr,t.edzatrosn as edzatrosn,max(t.nameotgr) as nameotgr,max(t.namezatr) as namezatr';
tx:=tx+' from(';

tx:=tx+' select ''0'' prizn, tn.nomer tnnomer,tn.type_ttn_type_ttn_id tntyp,to_char( tn.date_dok, ''DD.MM.YYYY'' ) datdok,';
tx:=tx+' substr(to_char( tn.date_ins, ''DD.MM.YYYY'' ),7,4) godins,s.kod kodotgr,';
tx:=tx+' round(decode(tm.koded_koded_id_uchet,s.koded_koded_id,tm.kol_uchet,(tm.kol_uchet*tronix_kof_koded(tm.sprav_sprav_id,tm.koded_koded_id_uchet,s.koded_koded_id))),6) kolotgr,';
tx:=tx+' edo1.namek edotgrosn,s.kod kodzatr,';
tx:=tx+' round(decode(tm.koded_koded_id_uchet,s.koded_koded_id,tm.kol_uchet,(tm.kol_uchet*tronix_kof_koded(tm.sprav_sprav_id,tm.koded_koded_id_uchet,s.koded_koded_id))),6) kolzatr,';
tx:=tx+' edo1.namek edzatrosn,replace(replace(tronix.sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') nameotgr,';
tx:=tx+' replace(replace(tronix.sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') namezatr';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.sprav s,tronix.koded ed,tronix.koded edo1,feb_zakaz zk';

tx:=tx+' where tm.ttn_ttn_id=tn.ttn_id  and tn.type_ttn_type_ttn_id in(5,12,9,44,59,11)';
tx:=tx+' and tm.sprav_sprav_id=s.sprav_id(+) and nvl(s.can_do_self,0)=0 and tronix.select_mat(s.tree_tree_id,'''+tr+''')=1';
tx:=tx+' and tm.sprav_sprav_id_zam_snab is null and nvl(tm.kol_uchet,0)<>0';
tx:=tx+' and tm.koded_koded_id_uchet=ed.koded_id(+) and s.koded_koded_id=edo1.koded_id(+)';
tx:=tx+' and tn.uzak_uzak_id=zk.nn and zk.id_project='+edit1.text;
tx:=tx+' and tn.user_date1 is not null and tn.date_ins is not null';

tx:=tx+' union all';

tx:=tx+' select ''1'' prizn,tn.nomer tnnomer,tn.type_ttn_type_ttn_id tntyp,to_char( tn.date_dok, ''DD.MM.YYYY'' ) datdok, ';
tx:=tx+' substr(to_char( tn.date_ins, ''DD.MM.YYYY'' ),7,4) godins, s.kod kodotgr,';
tx:=tx+' round(decode(tm.koded_koded_id_uchet,s.koded_koded_id,tm.kol_uchet,(tm.kol_uchet*tronix_kof_koded(tm.sprav_sprav_id,tm.koded_koded_id_uchet,s.koded_koded_id))),6) kolotgr,';
tx:=tx+' edo1.namek edotgrosn,s1.kod kodzatr,';
tx:=tx+' round(nvl(tm.kol_uchet*(nvl(tronix.kof_koded(tm.sprav_sprav_id,tm.koded_koded_id_uchet,nvl(tm.koded_koded_id_zam_snab,tm.koded_koded_id_uchet)),0)/nvl(tm.kof_zam_snab,1))*';
tx:=tx+' nvl(tronix.kof_koded(s1.sprav_id,nvl(tm.koded_koded_id_zam_snab,tm.koded_koded_id_uchet),s1.koded_koded_id),0),0),6) kolzatr,';
tx:=tx+' edo.namek edzatrosn,replace(replace(tronix.sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') nameotgr,';
tx:=tx+' replace(replace(tronix.sp_name(s1.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') namezatr';

tx:=tx+' from tronix.ttn_mat tm,tronix.ttn tn,tronix.sprav s,tronix.sprav s1,';
tx:=tx+' tronix.koded ed,tronix.koded edo,tronix.koded ed1,tronix.koded edo1,feb_zakaz zk';

tx:=tx+' where tm.sprav_sprav_id=s.sprav_id and nvl(s.can_do_self,0)=0 and tronix.select_mat(s.tree_tree_id,'''+tr+''')=1';
tx:=tx+' and tm.sprav_sprav_id_zam_snab=s1.sprav_id and nvl(s1.can_do_self,0)=0';
tx:=tx+' and tm.sprav_sprav_id_zam_snab is not null  and nvl(tm.kol_uchet,0)<>0';
tx:=tx+'  and tm.ttn_ttn_id=tn.ttn_id and tn.type_ttn_type_ttn_id in (5,12,9,44,59,11)';
tx:=tx+' and tn.uzak_uzak_id=zk.nn and zk.id_project='+edit1.text;
tx:=tx+' and tn.user_date1 is not null and tn.date_ins is not null';
tx:=tx+' and tm.koded_koded_id_uchet=ed.koded_id and tm.koded_koded_id_zam_snab=ed1.koded_id';
tx:=tx+' and s1.koded_koded_id=edo.koded_id and edo1.koded_id=s.koded_koded_id';
tx:=tx+' ) t';
tx:=tx+' group by t.godins,t.kodzatr,t.edzatrosn,t.prizn,t.kodotgr,t.edotgrosn';

//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('prizn').DisplayLAbel:='œ–»«Õ¿  ';
        FieldByName('godins').DisplayLAbel:='√Œƒ ';
        FieldByName('kodotgr').DisplayLAbel:=' Œƒ Œ“√–. ';
        FieldByName('kolotgr').DisplayLAbel:=' ŒÀ-¬Œ Œ“√–.  ';
        FieldByName('edotgrosn').DisplayLAbel:='≈ƒ.»«Ã.Œ“√–.Œ—Õ. ';
        FieldByName('kodzatr').DisplayLAbel:=' Œƒ «¿“–. ';
        FieldByName('kolzatr').DisplayLAbel:=' ŒÀ-¬Œ «¿“–. ';
        FieldByName('edzatrosn').DisplayLAbel:='≈ƒ.»«Ã.«¿“–.Œ—Õ. ';
        FieldByName('nameotgr').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ Œ“√–. ';
        FieldByName('namezatr').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ «¿“–. ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

 end;


end.
