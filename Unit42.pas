unit Unit42;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MemTableDataEh, Db, DataDriverEh, GridsEh, DBGridEh, MemTableEh,
  DBAccess, Ora, MemDS;

type
  TForm42 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    MemTableEh1: TMemTableEh;
    DBGridEh1: TDBGridEh;
    DataSetDriverEh1: TDataSetDriverEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form42: TForm42;

implementation

uses Unit36;

{$R *.dfm}

procedure TForm42.FormShow(Sender: TObject);
var tx:string;
begin

 tx:= ' Select nn,type_str,id_sp_work,up_nn,tex_sxlop, ';
tx:=tx+' kol,doc,poz,name, ';
tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=tk1) ntk1, ';
tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=tk2) ntk2, ';
tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=tk3) ntk3, ';
tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=tk4) ntk4, ';
tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=tk5) ntk5 ';
tx:=tx+' from ( ';
tx:=tx+' Select  nn,type_str,id_sp_work,up_nn,tex_sxlop, ';
tx:=tx+' Decode((SUBSTR(kaka,1,1)),''0'',SUBSTR(kaka,4,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+1,7))) tk1, ';
tx:=tx+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,12,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+9,7))) tk2, ';
tx:=tx+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,20,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+17,7))) tk3, ';
tx:=tx+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,28,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+25,7))) tk4, ';
tx:=tx+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,36,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+33,7))) tk5, ';
tx:=tx+' kol,doc,poz,name ';
tx:=tx+' from ';
tx:=tx+' ( ';
tx:=tx+' Select  nn,type_str,id_sp_work,up_nn, ';
tx:=tx+' (Select tex_texkompl_id from nordsy.tx_mat tmat where tmat.sp_sp_id=nn and tmat.type_relation_type_relation_id=1) tex_sxlop , ';
tx:=tx+' nordsy.load_marsh_ALL( nn  ,''œœ”≈'',''œ”≈'',null) kaka, ';
tx:=tx+'  (Select ident from tronix.document where document_id=nnn) doc,poz||podpoz poz, kol,  name ';
tx:=tx+'  from tronix.sp ';
tx:=tx+' connect by prior nn=up_nn ';
tx:=tx+' start with nn in ';
tx:=tx+' ( ';
tx:=tx+' Select nn   from tronix.sp ';
tx:=tx+' where nn in ( ';
tx:=tx+' Select sp_sp_id from nordsy.tx_mat ';
tx:=tx+' where ';
tx:=tx+' tex_texkompl_id in ';
tx:=tx+' (Select texkompl_id from tx_texkompl ';
tx:=tx+' connect by prior texkompl_id=texkompl_texkompl_id ';
tx:=tx+' start with texkompl_id='+Form36.MEMTABLEEH1.FieldByName('texkompl_id').AsString+') )group by nn) ';
tx:=tx+' ) ';
tx:=tx+' ) order by doc,poz ';

 OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;
MemTableEh1.TreeList.Active := True;


  MemTableEh1.Open;
end;

procedure TForm42.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   OraQuery1.Close;

   DBGridEh1.DataSource.DataSet:=nil;
MemTableEh1.Close;
DBGridEh1.DataSource.DataSet:=MemTableEh1;
   OraQuery1.Fields.Clear; ///”·‡Ú¸
  MemTableEh1.Fields.Clear;
end;

end.
