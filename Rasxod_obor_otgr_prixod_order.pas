unit Rasxod_obor_otgr_prixod_order;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls;

type
  TFRasxod_obor_otgr_prixod_order = class(TForm)
    DBGridEh1: TDBGridEh;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1proe: TStringField;
    OraQuery1godins: TStringField;
    OraQuery1mesins: TStringField;
    OraQuery1prixo: TStringField;
    OraQuery1schfp: TStringField;
    OraQuery1tnp: TStringField;
    OraQuery1post: TStringField;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRasxod_obor_otgr_prixod_order: TFRasxod_obor_otgr_prixod_order;
implementation

uses Unit9;

{$R *.dfm}


procedure TFRasxod_obor_otgr_prixod_order.FormShow(Sender: TObject);
var
tx: string;
begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='4011';
//ShowMessage(Form58.Caption);

tx:=' ';
tx:='select tt.proe as proe,tt.godins as godins,tt.mesins as mesins,tt.prixo as prixo,tt.schfp as schfp,tt.tnp as tnp,tt.post as post';
tx:=tx+' from(';
tx:=tx+' select distinct(t1.prix||t1.schf||t1.nacl) prix,t1.mesins mesins,t1.godins godins,t1.prix prixo,t1.schf schfp,t1.nacl tnp,t1.post post,t1.proe proe';
tx:=tx+' from(';

tx:=tx+' select (tp.nomer||decode(tp.date_ins,null,'''','' ÓÚ ''||to_char( tp.date_ins, ''DD.MM.YYYY'' ))) prix,';
tx:=tx+' decode(tp.type_ttn_type_ttn_id,1,decode(t.calc_fact_calc_fact_id,null,'''',cf.num_calc||decode(cf.date_cre,null,'''','' ÓÚ ''||to_char(cf.date_cre, ''DD.MM.YYYY'' ))),';
tx:=tx+'(select name from tronix.type_ttn where type_ttn_id=tp.type_ttn_type_ttn_id)) schf,';
tx:=tx+' decode(t.nacl_nacl_id,null,'''',na.nomer||'' ÓÚ ''||decode(na.dat_nacl,null,'''',to_char( na.dat_nacl, ''DD.MM.YYYY'' ))) nacl,';
tx:=tx+' substr(to_char( tp.date_ins, ''DD.MM.YYYY'' ),4,2) mesins,substr(to_char( tp.date_ins, ''DD.MM.YYYY'' ),7,4) godins ,fi.ident post,pr.name proe';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.ttn tp,tronix.ttn_mat t,';
tx:=tx+' tronix.sprav s,tronix.koded ed,tronix.koded edo1,';
tx:=tx+' tronix.calc_fact cf,tronix.nacl na,tronix.firm fi,feb_zakaz zk,tronix.project_list pr';

tx:=tx+' where tm.ttn_ttn_id=tn.ttn_id and tn.type_ttn_type_ttn_id in (5,12,9,44,59,11) and nvl(tm.kol_uchet,0)<>0';
tx:=tx+' and tm.sprav_sprav_id=s.sprav_id(+) and tronix_select_mat(s.tree_tree_id,''02'')=1';
tx:=tx+' and tm.koded_koded_id_uchet=ed.koded_id(+) and s.koded_koded_id=edo1.koded_id(+)';
tx:=tx+' and nvl(s.can_do_self,0)=0 and tm.sprav_sprav_id_zam_snab is null';
tx:=tx+' and tn.uzak_uzak_id=zk.nn and zk.id_project='+edit1.text;
tx:=tx+' and pr.project_id=zk.id_project';
tx:=tx+' and tn.user_date1 is not null and tn.date_ins is not null';
tx:=tx+' and t.ttn_mat_id=tm.ttn_mat_ttn_mat_id and t.ttn_ttn_id=tp.ttn_id';
tx:=tx+' and t.calc_fact_calc_fact_id=cf.calc_fact_id(+) and t.nacl_nacl_id=na.nacl_id(+)';
tx:=tx+' and tp.post_post_id_from=fi.firm_id(+)';

tx:=tx+' union all';

tx:=tx+' select (tp.nomer||decode(tp.date_ins,null,'''','' ÓÚ ''||to_char( tp.date_ins, ''DD.MM.YYYY'' ))) prix,';
tx:=tx+' decode(tp.type_ttn_type_ttn_id,1,decode(t.calc_fact_calc_fact_id,null,'''',cf.num_calc||decode(cf.date_cre,null,'''','' ÓÚ ''||to_char(cf.date_cre, ''DD.MM.YYYY'' ))),';
tx:=tx+'(select name from tronix_type_ttn where type_ttn_id=tp.type_ttn_type_ttn_id)) schf,';
tx:=tx+' decode(t.nacl_nacl_id,null,'''',na.nomer||'' ÓÚ ''||decode(na.dat_nacl,null,'''',to_char( na.dat_nacl, ''DD.MM.YYYY''))) nacl,';
tx:=tx+' substr(to_char( tp.date_ins, ''DD.MM.YYYY''),4,2) mesins,substr(to_char( tp.date_ins, ''DD.MM.YYYY'' ),7,4) godins,fi.ident post,pr.name proe';

tx:=tx+' from tronix.ttn_mat tm,tronix.ttn tn,tronix.ttn tp,tronix.ttn_mat t,';
tx:=tx+' tronix.sprav s,tronix.sprav s1,tronix.koded ed,tronix.koded edo,tronix.koded ed1,tronix.koded edo1,';
tx:=tx+' tronix.calc_fact cf,tronix.nacl na,tronix.firm fi,feb_zakaz zk,tronix.project_list pr';

tx:=tx+' where tm.sprav_sprav_id=s.sprav_id(+) and nvl(s.can_do_self,0)=0';
tx:=tx+' and tm.sprav_sprav_id_zam_snab=s1.sprav_id(+) and nvl(s1.can_do_self,0)=0';
tx:=tx+' and tm.sprav_sprav_id_zam_snab is not null and tronix_select_mat(s1.tree_tree_id,''02'')=1';
tx:=tx+' and nvl(tm.kol_uchet,0)<>0 and tm.ttn_ttn_id=tn.ttn_id';
tx:=tx+' and tn.type_ttn_type_ttn_id in (5,12,9,44,59,11)';
tx:=tx+' and tn.uzak_uzak_id=zk.nn and zk.id_project='+edit1.text;
tx:=tx+' and pr.project_id=zk.id_project';
tx:=tx+' and tn.user_date1 is not null and tn.date_ins is not null';
tx:=tx+' and tn.user_date1 is not null and tn.date_ins is not null';
tx:=tx+' and tm.koded_koded_id_uchet=ed.koded_id(+) and tm.koded_koded_id_zam_snab=ed1.koded_id(+)';
tx:=tx+' and s1.koded_koded_id=edo.koded_id(+) and edo1.koded_id(+)=s.koded_koded_id';
tx:=tx+' and t.ttn_mat_id=tm.ttn_mat_ttn_mat_id and t.ttn_ttn_id=tp.ttn_id';
tx:=tx+' and t.calc_fact_calc_fact_id=cf.calc_fact_id(+) and t.nacl_nacl_id=na.nacl_id(+)';
tx:=tx+' and tp.post_post_id_from=fi.firm_id(+)';
tx:=tx+') t1';
tx:=tx+') tt';
tx:=tx+' order by tt.godins,tt.mesins,tt.prix,tt.prixo,tt.schfp,tt.tnp,tt.post,tt.proe';

//ShowMessage(tx);
  With OraQuery1 Do
     begin
        FieldByName('proe').DisplayLAbel:='œ–Œ≈ “ ';
        FieldByName('godins').DisplayLAbel:='√Œƒ ';
        FieldByName('mesins').DisplayLAbel:='Ã≈—ﬂ÷ ';
        FieldByName('prixo').DisplayLAbel:='œ/Œ  ';
        FieldByName('schfp').DisplayLAbel:='—◊/‘ ';
        FieldByName('tnp').DisplayLAbel:='Õ¿ À¿ƒÕ¿ﬂ ';
        FieldByName('post').DisplayLAbel:='œŒ—“¿¬Ÿ»  ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

 end;


procedure TFRasxod_obor_otgr_prixod_order.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFRasxod_obor_otgr_prixod_order.Button1Click(Sender: TObject);
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

