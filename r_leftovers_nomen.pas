unit r_leftovers_nomen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, Ora, StdCtrls, CheckLst;

type
  Tleftovers = class(TForm)
    projects: TComboBox;
    invi_projects: TComboBox;
    zakaz: TComboBox;
    invi_zakaz: TComboBox;
    dep: TComboBox;
    invi_dep: TComboBox;
    OraQueryS: TOraQuery;
    filter_type: TCheckListBox;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure projectsChange(Sender: TObject);
    procedure filter_typeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  leftovers: Tleftovers;

implementation

uses Unit1;

{$R *.dfm}

procedure Tleftovers.FormShow(Sender: TObject);

var
SQL : string;

begin
  SQL := 'select project_id, name from tronix.project_list where date_end is null order by project ASC';
  if not form1.execQuery(OraQueryS, SQL, false) then
    exit;

  while not OraQueryS.Eof do
  begin
    projects.Items.Add(OraQueryS.FieldByName('NAME').asString);
    invi_projects.Items.Add(OraQueryS.FieldByName('PROJECT_ID').asString);

    OraQueryS.Next;
  end;

  SQL := 'select dep_id, nomer from kadry_dep where type_dep_type_dep_id = 5 order by nomer ASC';
  if not form1.execQuery(OraQueryS, SQL, false) then
    exit;

  while not OraQueryS.Eof do
  begin
    dep.Items.Add(OraQueryS.FieldByName('NOMER').asString);
    invi_dep.Items.Add(OraQueryS.FieldByName('DEP_ID').asString);

    OraQueryS.Next;
  end;

  filter_type.Checked[3] := true;

end;

procedure Tleftovers.projectsChange(Sender: TObject);

var
SQL : string;

begin

  zakaz.Clear;
  invi_zakaz.Clear;

  SQL := 'select nn, zak from tronix.zakaz where id_project = ' + invi_projects.Items[projects.ItemIndex] + ' order by zak DESC';
  if not form1.execQuery(OraQueryS, SQL, false) then
    exit;

  while not OraQueryS.Eof do
  begin
    zakaz.Items.Add(OraQueryS.FieldByName('zak').asString);
    invi_zakaz.Items.Add(OraQueryS.FieldByName('nn').asString);

    OraQueryS.Next;
  end;

  zakaz.Enabled := true;

end;

procedure Tleftovers.filter_typeClick(Sender: TObject);
begin
if (((not filter_type.Checked[0]) and (not filter_type.Checked[1]) and (not filter_type.Checked[2])) or ((filter_type.Checked[0]) and (filter_type.Checked[1]) and (filter_type.Checked[2]))) then
begin
  filter_type.Checked[0] := false;
  filter_type.Checked[1] := false;
  filter_type.Checked[2] := false;
  filter_type.Checked[3] := true;
end;

if ((filter_type.Checked[0]) or (filter_type.Checked[1]) or (filter_type.Checked[2])) then
  filter_type.Checked[3] := false;
end;

procedure Tleftovers.Button1Click(Sender: TObject);

var
SQL,
ELEM_TYPE : string;

begin

  exit;
  
  if zakaz.ItemIndex = -1 then
  begin
    showmessage('Выберите заказ');
    exit;
  end;

  if form1.SCAlive then
    SQL := form1.ServerRequest('ZAPAS_SKLAD')
  else
    exit;

  ELEM_TYPE := '(';

  if filter_type.Checked[0] then
    ELEM_TYPE := ELEM_TYPE + '(tronix_select_mat(TRONIX_SPRAV.tree_tree_id, ''01'' ) = 1 AND NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) <> 1) or ';

  if filter_type.Checked[1] then
    ELEM_TYPE := ELEM_TYPE + '(tronix_select_mat(TRONIX_SPRAV.tree_tree_id, ''02'' ) = 1 AND NVL(TRONIX_SPRAV.CAN_DO_SELF, 0) <> 1) or '
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

  (*
  select dp.nomer as sklad, sp.kod, substr(upper(ltrim(tronix_sp_sp_name(sp.sprav_id, null, 3))), 1, 200) as MTR_NAME, A.kol, kd.namek as koded,
  (A.kol * tronix_kof_koded(A.sprav_id, A.koded_id, kdo.koded_id)) as kol_uchet, kdo.namek as koded_uchet, pr.name from
  (select dp.dep_id, zp.project_project_id as project_id, sp.koded_koded_id as koded_id, sp.sprav_id,
  sum(zp.kol_uchet * tronix_kof_koded(zp.sprav_sprav_id, zp.koded_koded_id_uchet, sp.koded_koded_id)) as kol from tronix.zapas zp, kadry_dep dp,
  tronix_sprav sp where zp.dep_dep_id = dp.dep_id and dp.type_dep_type_dep_id = 5 and zp.sprav_sprav_id = sp.sprav_id and
  zp.project_project_id in (392, 406, 408) and (tronix_select_mat(sp.tree_tree_id, '02' ) = 1 and NVL(sp.CAN_DO_SELF, 0) <> 1) group by dp.dep_id,
  zp.project_project_id, sp.koded_koded_id, sp.sprav_id) A, tronix_koded kd, tronix_koded kdo, tronix.project_list pr, kadry_dep dp, tronix_sprav sp
  where A.dep_id = dp.dep_id(+) and A.project_id = pr.project_id(+) and A.sprav_id = sp.sprav_id(+) and A.koded_id = kd.koded_id and
  decode(sp.koded_koded_id2, null, A.koded_id, sp.koded_koded_id2) = kdo.koded_id order by sp.kod, dp.nomer, pr.name
  *)

end;

end.
