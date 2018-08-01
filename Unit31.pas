unit Unit31;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MemTableDataEh, Db, MemTableEh, DBAccess, Ora, MemDS,
  DataDriverEh, GridsEh, DBGridEh, StdCtrls;

type
  TForm31 = class(TForm)
    OraQuery1: TOraQuery;
    MemTableEh1: TMemTableEh;
    DBGridEh1: TDBGridEh;
    DataSetDriverEh1: TDataSetDriverEh;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form31: TForm31;

implementation

{$R *.dfm}

procedure TForm31.FormShow(Sender: TObject);
var tx: string;
begin

tx:=' Select tx.nomer ,tx.name ,(Select nomer from nordsy.dep  dep where dep.dep_id=tx.dep_dep_id) dep,tx.trudoem, tx.texkompl_id texcompl_befo , ';
tx:=tx+' null texcompl_afto ';
tx:=tx+' from tx_texkompl tx';
tx:=tx+' where texkompl_id=( ';
tx:=tx+' Select p_enter from(   ';
tx:=tx+' Select max(texkompl_id) p_enter,up_tex  from ';
tx:=tx+' ( ';
tx:=tx+' Select tx.texkompl_id, nordsy.get_up_ttn(tx.texkompl_id,8) up_tex  from nordsy.tx_mat tmat, tx_texkompl tx ';
tx:=tx+' where tmat.sprav_sprav_id='+Edit1.Text;
tx:=tx+' and  tex_texkompl_id=tx.texkompl_id ';
tx:=tx+' and project_project_id='+Edit3.Text;
tx:=tx+' ) ';
tx:=tx+' where up_tex='+Edit2.Text;
tx:=tx+' group by  up_tex)) ';
tx:=tx+' union all ';
tx:=tx+' Select (Select nomer from tx_texkompl where texkompl_id=texcompl_befo) nomer ,(Select name from tx_texkompl where texkompl_id=texcompl_befo) name ';
tx:=tx+' ,(Select nomer from nordsy.dep where dep_id=(Select dep_dep_id from tx_texkompl where texkompl_id=texcompl_befo)) dep,(Select trudoem from tx_texkompl where texkompl_id=texcompl_befo ) trud ';
tx:=tx+' ,texcompl_befo ,texcompl_afto ';
tx:=tx+'  FROM nordsy.tex_or_c ';
tx:=tx+'  CONNECT BY prior texcompl_befo=texcompl_afto ';
tx:=tx+' START WITH texcompl_afto = ( ';

tx:=tx+' Select  texkompl_id  ';
tx:=tx+' from tx_texkompl ';
tx:=tx+' where texkompl_id=( ';
tx:=tx+' Select p_enter from(   ';
tx:=tx+' Select max(texkompl_id) p_enter,up_tex  from ';
tx:=tx+' ( ';
tx:=tx+' Select tx.texkompl_id, nordsy.get_up_ttn(tx.texkompl_id,8) up_tex  from nordsy.tx_mat tmat, tx_texkompl tx ';
tx:=tx+' where tmat.sprav_sprav_id='+Edit1.Text;
tx:=tx+' and  tex_texkompl_id=tx.texkompl_id ';
tx:=tx+' and project_project_id='+Edit3.Text;
tx:=tx+' ) ';
tx:=tx+' where up_tex='+Edit2.Text;
tx:=tx+' group by  up_tex))) ';






  OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;

MemTableEh1.TreeList.Active := True;
  MemTableEh1.Open;
end;

procedure TForm31.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close;
  Edit3.Text:='';
    Edit2.Text:='';
      Edit1.Text:='';
   MemTableEh1.Close;
end;

end.
