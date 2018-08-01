unit Unit30;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, GridsEh;

type
  TForm30 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1texkompl_id: TFloatField;
    OraQuery1nomer: TStringField;
    OraQuery1name: TStringField;
    OraQuery1nakl: TStringField;
    OraQuery2: TOraQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure OraQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form30: TForm30;

implementation

uses Unit31;

{$R *.dfm}

procedure TForm30.FormShow(Sender: TObject);
var tx:String;
begin
// tx:='Select tx.texkompl_id, tx.nomer,tx.name from nordsy.tx_mat tmat, tx_texkompl tx  ';
//tx:=tx+' where tmat.sprav_sprav_id='+Edit1.Text;
//tx:=tx+' and  tex_texkompl_id=tx.texkompl_id  ';
//tx:=tx+' and tmat.type_relation_type_relation_id=9 ';
//tx:=tx+' and project_project_id='+Edit2.text;
 //  ShowMessage(tx);

//tx:=' Select tx.texkompl_id, tx.nomer,tx.name,ttn.nomer nakl,ttn.date_dok nakl_dat, ttn.date_ins nakl_ins ';
//tx:=tx+'  from nordsy.tx_mat tmat, tx_texkompl tx, tronix.ttn_mat ttmat ,  tronix.ttn ttn  ';
//tx:=tx+'  where tmat.sprav_sprav_id='+Edit1.Text;
//tx:=tx+'  and  tex_texkompl_id=tx.texkompl_id  ';
//tx:=tx+'  and tmat.type_relation_type_relation_id=9  ';
//tx:=tx+'  and tx.project_project_id='+Edit2.text;
//tx:=tx+'  and ttmat.sprav_sprav_id=tmat.sprav_sprav_id(+)   ';
//tx:=tx+'  and ttmat.texkompl_texkompl_id_from in (Select texkompl_id from dual union all Select texkompl_id from tx_texkompl where texkompl_texkompl_id=tx.texkompl_id )  ';
//tx:=tx+'  and ttn.ttn_id(+)=ttmat.ttn_ttn_id  ';

//tx:='Select TN texkompl_id, (Select Nomer from tx_texkompl where texkompl_id=TN) nomer, (Select Name from tx_texkompl where texkompl_id=TN) name';
//tx:=tx+' from ';
//tx:=tx+' (Select TN from ';
//tx:=tx+' ( ';
//tx:=tx+' Select  nordsy.get_up_ttn(tx.texkompl_id,8) TN ';
//tx:=tx+'  from nordsy.tx_mat tmat, tx_texkompl tx ';
//tx:=tx+'  where tmat.sprav_sprav_id='+Edit1.Text;
//tx:=tx+'  and  tex_texkompl_id=tx.texkompl_id ';
//tx:=tx+'  and tx.project_project_id='+Edit2.text;
//tx:=tx+' ) ';
//tx:=tx+' group by TN) ';


//tx:='Select TN texkompl_id, (Select Nomer from tx_texkompl where texkompl_id=TN) nomer, (Select Name from tx_texkompl where texkompl_id=TN) name ';
//tx:=tx+' from ';
//tx:=tx+' (Select nordsy.get_up_ttn(tx.texkompl_id,8) TN ';
//tx:=tx+'  from nordsy.tx_mat tmat, tx_texkompl tx, nordsy.tex_or_c orc ';
//tx:=tx+'  where tmat.sprav_sprav_id='+Edit1.Text;
//tx:=tx+'  and  tex_texkompl_id=tx.texkompl_id ';
//tx:=tx+'  and tx.project_project_id='+Edit2.text;
//tx:=tx+'  and (orc.texcompl_afto=tx.texkompl_id and (Select count(*) from nordsy.tex_or_c  where texcompl_befo=tx.texkompl_id) =0) ';
//tx:=tx+' union all ';
//tx:=tx+' Select nordsy.get_up_ttn(tx.texkompl_id,8) TN ';
//tx:=tx+'  from nordsy.tx_mat tmat, tx_texkompl tx ';
//tx:=tx+'  where tmat.sprav_sprav_id='+Edit1.Text;
//tx:=tx+'  and  tex_texkompl_id=tx.texkompl_id ';
//tx:=tx+'  and tmat.type_relation_type_relation_id=9 ';
//tx:=tx+'  and tx.project_project_id='+Edit2.text+')';
//tx:=tx+' group by TN ';

tx:=' select   ';
tx:=tx+'         t.nomer nomer,';
tx:=tx+'         t.texkompl_id texkompl_id,t.name name';
tx:=tx+'    from tx_tx_mat m,tx_texkompl t,tx_TYPE_RELATION_poz typ';
tx:=tx+'    where m.TEX_TEXKOMPL_ID        =t.texkompl_id            ';
tx:=tx+'        and m.TYPE_RELATION_TYPE_RELATION_ID   =typ.TYPE_RELATION_poz_ID';
tx:=tx+'        and t.PROJECT_PROJECT_ID='+Edit2.text;
tx:=tx+'        and typ.key=''03''';
tx:=tx+'        and m.SPRAV_SPRAV_ID ='+Edit1.Text;
tx:=tx+'   union';
tx:=tx+'    select';
tx:=tx+'         t.nomer nomer,';
tx:=tx+'         t.texkompl_id texkompl_id,t.name name';
tx:=tx+'    from tx_tx_mat m,tx_texkompl t,tx_TYPE_RELATION_poz typ,';
tx:=tx+'         tronix_sostav_1level s';
tx:=tx+'    where m.TEX_TEXKOMPL_ID        =t.texkompl_id';
tx:=tx+'        and m.TYPE_RELATION_TYPE_RELATION_ID   =typ.TYPE_RELATION_poz_ID';
tx:=tx+'        and t.PROJECT_PROJECT_ID='+Edit2.text;
tx:=tx+'        and typ.key=''03''';
tx:=tx+'        and s.SPRAV_SPRAV_ID_SOSTAV='+Edit1.Text;
tx:=tx+'        and m.SPRAV_SPRAV_ID= s.SPRAV_SPRAV_ID';
tx:=tx+'        and  s.type_yzl=''KOMPL''  and  s.type is not null';


OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;

end;

procedure TForm30.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 OraQuery1.Close;
 Edit2.text:='';
  Edit1.text:='';
  OraQuery2.Close;
end;

procedure TForm30.DBGridEh1DblClick(Sender: TObject);
begin
form31.Caption:=oraQuery1.FieldByName('nomer').asString;
  Form31.Edit1.Text:=Edit1.text;  // spr_id
  Form31.Edit2.Text:=oraQuery1.FieldByName('texkompl_id').asString; // id_TN
  Form31.Edit3.Text:=Edit2.text;    //project
  form31.ShowModal();
end;

procedure TForm30.OraQuery1CalcFields(DataSet: TDataSet);
var tx:string;
begin
tx:=' Select ttn.nomer||'' дата ''||to_char(ttn.date_dok,''dd.mm.yy'')||'' проводка ''||Decode(ttn.date_ins,null,'' отсут'',to_char(ttn.date_ins,''dd.mm.yy''))||'' кол ''||ttmat.kol_uchet as res';
tx:=tx+'  from nordsy.tx_mat tmat, tx_texkompl tx, tronix.ttn_mat ttmat ,  tronix.ttn ttn ';
tx:=tx+'  where tmat.sprav_sprav_id='+Edit1.Text;
tx:=tx+'  and  tex_texkompl_id=tx.texkompl_id';
tx:=tx+'  and tmat.type_relation_type_relation_id=9';
tx:=tx+'  and tx.project_project_id='+Edit2.text;
tx:=tx+'  and ttmat.sprav_sprav_id=tmat.sprav_sprav_id';
tx:=tx+' and ttmat.texkompl_texkompl_id_from in (Select texkompl_id from dual union all Select texkompl_id from tx_texkompl where texkompl_texkompl_id=tx.texkompl_id )';
tx:=tx+'  and ttn.ttn_id=ttmat.ttn_ttn_id';
tx:=tx+' and ttn.type_ttn_type_ttn_id=34';
tx:=tx+' and tx.texkompl_id='+oraQuery1.FieldByName('texkompl_id').AsString;
//ShowMessage(tx);
 OraQuery2.SQL.Text:=tx;
 OraQuery2.ExecSQL;
 oraQuery1.FieldByName('nakl').Value:=oraQuery2.FieldByName('res').AsString;
end;

end.
