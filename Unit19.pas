unit Unit19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, DB, MemDS, DBAccess, Ora, GridsEh;

type
  TForm19 = class(TForm)
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

{$R *.dfm}

procedure TForm19.FormShow(Sender: TObject);
var tx:String;
begin


  tx:='Select tx.texkompl_id,   ';
  tx:=tx+'nvl(nordsy.summ_nar_tx(tx.texkompl_id),0) sum_nar,  ';
  tx:=tx+'nvl( nordsy.trud_tx( tx.texkompl_id),0) sum_tex,       ';
tx:=tx+'(Select sum(decode(otk_end,null,0,DECODE(user_prb,null,0,trudoem)))       ';
tx:=tx+'from tx_texkompl                                                             ';
tx:=tx+'connect by prior texkompl_id = texkompl_texkompl_ID                           ';
tx:=tx+'start	with  texkompl_texkompl_ID=tx.texkompl_id) prb  ,         ';
  tx:=tx+'(Select nomer from tx_texkompl where texkompl_id=tx.texkompl_id) nomer,       ';
  tx:=tx+'(Select name from tx_texkompl where texkompl_id=tx.texkompl_id) name,       ';
  tx:=tx+'(Select DECODE(otk_end,null,NULL,otk_end) from tx_texkompl where texkompl_id=tx.texkompl_id) otk_end ';
  tx:=tx+'from                                                                                                   ';
  tx:=tx+'(Select texkompl_id,type_tex_type_tex_id from tx_texkompl                                              ';
  tx:=tx+'where texkompl_texkompl_ID='  +Label1.Caption+')tx                                                           ';


   //oraQuery1.SQL.text:=tx;
 oraQuery1.ExecSQL;

end;

procedure TForm19.FormClose(Sender: TObject; var Action: TCloseAction);
begin
OraQuery1.Close;
end;

procedure TForm19.DBGridEh1DblClick(Sender: TObject);
begin
  Label1.Caption:=oraQuery1.FieldByName('texkompl_id').asString;
  //   oraQuery1.SQL.text:=tx;

 oraQuery1.ExecSQL;
end;


end.
