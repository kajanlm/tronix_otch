unit Rasxod_mater_otgr_prixod_order;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls, ComObj;

type
  TFRasxod_mater_otgr_prixod_order = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1god: TStringField;
    OraQuery1nompr: TStringField;
    OraQuery1datpr: TStringField;
    OraQuery1nomtn: TStringField;
    OraQuery1dattn: TStringField;
    OraQuery1nomschf: TStringField;
    OraQuery1datschf: TStringField;
    OraQuery1post: TStringField;
    OraQuery1inn: TStringField;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRasxod_mater_otgr_prixod_order: TFRasxod_mater_otgr_prixod_order;
  MyBookmark: TBookMark;
implementation

uses Unit9;

{$R *.dfm}


procedure TFRasxod_mater_otgr_prixod_order.FormShow(Sender: TObject);
var
FExcel,Sheet: OleVariant;
dna,nomna,dsch,nomsch,tx:string;
nk: integer;
begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='4011';
//ShowMessage(Form58.Caption);

tx:=' ';
{*
tx:='substr(l.prix,1,4) as god, substr(l.prix,instr(l.prix,''$'',1,2)+1,instr(l.prix,''$'',1,3)-instr(l.prix,''$'',1,2)-1) as nompr,';
tx:=tx+' (substr(l.prix,14,2)||substr(l.prix,10,4)||substr(l.prix,1,4)) as datpr,';
tx:=tx+' substr(l.prix,instr(l.prix,''$'',1,3)+1,instr(l.prix,''$'',1,4)-instr(l.prix,''$'',1,3)-1) as nomtn,';
tx:=tx+' substr(l.prix,instr(l.prix,''$'',1,4)+1,instr(l.prix,''$'',1,5)-instr(l.prix,''$'',1,4)-1) as dattn,';
tx:=tx+' substr(l.prix,instr(l.prix,''$'',1,5)+1,instr(l.prix,''$'',1,6)-instr(l.prix,''$'',1,5)-1) as nomschf,';
tx:=tx+' substr(l.prix,instr(l.prix,''$'',1,6)+1,instr(l.prix,''$'',1,7)-instr(l.prix,''$'',1,6)-1) as datschf,';
tx:=tx+' substr(l.prix,instr(l.prix,''$'',1,7)+1,instr(l.prix,''$'',1,8)-instr(l.prix,''$'',1,7)-1) as post,';
tx:=tx+' substr(l.prix,instr(l.prix,''$'',1,8)+1,instr(l.prix,''$'',1,9)-instr(l.prix,''$'',1,8)-1) as inn';
*}
tx:=tx+' select substr(l.prix,1,4) as god, substr(l.prix,instr(l.prix,''$'',1,2)+1,instr(l.prix,''$'',1,3)-instr(l.prix,''$'',1,2)-1) as nompr,';
tx:=tx+' (substr(l.prix,14,2)||substr(l.prix,10,4)||substr(l.prix,1,4)) as datpr,';
tx:=tx+' substr(l.prix,instr(l.prix,''$'',1,3)+1,instr(l.prix,''$'',1,4)-instr(l.prix,''$'',1,3)-1) as nomtn,';
tx:=tx+' substr(l.prix,instr(l.prix,''$'',1,4)+1,instr(l.prix,''$'',1,5)-instr(l.prix,''$'',1,4)-1) as dattn,';
tx:=tx+' substr(l.prix,instr(l.prix,''$'',1,5)+1,instr(l.prix,''$'',1,6)-instr(l.prix,''$'',1,5)-1) as nomschf,';
tx:=tx+' substr(l.prix,instr(l.prix,''$'',1,6)+1,instr(l.prix,''$'',1,7)-instr(l.prix,''$'',1,6)-1) as datschf,';
tx:=tx+' substr(l.prix,instr(l.prix,''$'',1,7)+1,instr(l.prix,''$'',1,8)-instr(l.prix,''$'',1,7)-1) as post,';
tx:=tx+' substr(l.prix,instr(l.prix,''$'',1,8)+1,instr(l.prix,''$'',1,9)-instr(l.prix,''$'',1,8)-1) as inn';
//l.prix *}

tx:=tx+' from (';

tx:=tx+' select distinct substr(t1.prix,1,4)||''$''||t1.prix||''$'' prix';
tx:=tx+' from (';

tx:=tx+' select tt.kod kod,tt.godins godins,';
tx:=tx+' (select max(to_char(tp.date_ins, ''YYYY.MM.DD'') ||''$''|| tp.nomer ||''$''|| na.nomer ||''$''|| to_char(na.dat_nacl, ''DD.MM.YYYY'' ) ||''$''||';
tx:=tx+' cf.num_calc ||''$''|| to_char(cf.date_cre, ''DD.MM.YYYY'' ) ||''$''|| fi.ident ||''$''|| fi.kod_ni)';

tx:=tx+' from tronix.ttn tp,tronix.ttn_mat t,tronix.calc_fact cf,tronix.nacl na,tronix.firm fi,tronix.sprav s';

tx:=tx+' where tp.type_ttn_type_ttn_id in(1) and t.ttn_ttn_id=tp.ttn_id';
tx:=tx+' and tp.user_date1 is not null and tp.date_ins is not null';
tx:=tx+' and t.sprav_sprav_id=s.sprav_id and s.kod=tt.kod';
tx:=tx+' and t.calc_fact_calc_fact_id=cf.calc_fact_id';
tx:=tx+' and t.nacl_nacl_id=na.nacl_id and tp.post_post_id_from=fi.firm_id';
tx:=tx+' and substr(to_char(tp.date_ins, ''DD.MM.YYYY''),7,4)<=tt.godins';
tx:=tx+' ) prix';

tx:=tx+' from(';
tx:=tx+' select distinct s.kod kod, substr(to_char( tn.date_ins, ''DD.MM.YYYY'' ),7,4) godins';
tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.sprav s,feb_zakaz zk,tronix.project_list pr';

tx:=tx+' where tm.ttn_ttn_id=tn.ttn_id and tn.type_ttn_type_ttn_id in (5,12,9,44,59,11)';
tx:=tx+' and tm.sprav_sprav_id=s.sprav_id and tronix.select_mat(s.tree_tree_id,''01'')=1';
tx:=tx+' and nvl(tm.kol_uchet,0)<>0 and nvl(s.can_do_self,0)=0';
tx:=tx+' and tn.uzak_uzak_id=zk.nn and zk.id_project='+edit1.text;
tx:=tx+' and pr.project_id=zk.id_project';
tx:=tx+' and tn.user_date1 is not null and tn.date_ins is not null';
//tx:=tx+' and rownum<4';
tx:=tx+') tt';
tx:=tx+' order by tt.kod,tt.godins';
tx:=tx+' ) t1';
tx:=tx+' ) l';

//ShowMessage(tx);
{*
  With OraQuery1 Do
     begin
        FieldByName('god').DisplayLAbel:='ÃÎÄ ';
        FieldByName('prix').DisplayLAbel:='ÏÐÈÕÎÄ ';
        FieldByName('proe').DisplayLAbel:='ÏÐÎÅÊÒ ';
     end;
*}
   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_MATER_OTGR_PRIXOD_ORDER.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_MATER_OTGR_PRIXOD_ORDER.xls');

FExcel.Workbooks[1].WorkSheets[1].Name := 'Ëèñò1';
sheet:=FExcel.Workbooks[1].WorkSheets[1];

OraQuery1.Open;
OraQuery1.First;

nk:=1;

While not OraQuery1.eof do
Begin
Inc(nk);


dna:='';
nomna:='';
dsch:='';
nomsch:='';

dna:=OraQuery1.FieldByName('dattn').asString;
if	Copy(dna,7,4)='1900' then
dna:='';

nomna:=OraQuery1.FieldByName('nomtn').asString;
if Pos('á/í',nomna)<>0 then
nomna:='';

nomsch:=OraQuery1.FieldByName('nomschf').asString;
if  Pos('á/í',nomsch)<>0 then
nomsch:='';

dsch:=OraQuery1.FieldByName('datschf').asString;
if	Copy(dsch,7,4)='1900' then
dsch:='';


Sheet.Cells[nk,1].Value:=OraQuery1.FieldByName('god').asString;
Sheet.Cells[nk,2].Value:=OraQuery1.FieldByName('nompr').asString;
Sheet.Cells[nk,3].Value:=OraQuery1.FieldByName('datpr').asString;
Sheet.Cells[nk,4].Value:=nomna;
Sheet.Cells[nk,5].Value:=dna;
Sheet.Cells[nk,6].Value:=nomsch;
Sheet.Cells[nk,7].Value:=dsch;
Sheet.Cells[nk,8].Value:=OraQuery1.FieldByName('post').asString;
Sheet.Cells[nk,9].Value:=OraQuery1.FieldByName('inn').asString;

oraQuery1.Next;

End;

Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[nk+1,9]].RowHeight :=13;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,9]].HorizontalAlignment:=xlGeneral;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,9]].VerticalAlignment:=xlTop;
//Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,14]].WrapText:=True;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,9]].Rows.AutoFit;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,9]].borders.linestyle:=xlContinuous;

FExcel.Visible:=True;
end;

procedure TFRasxod_mater_otgr_prixod_order.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

end.

