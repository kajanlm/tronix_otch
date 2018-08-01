unit Unit18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, GridsEh;

type
  TForm18 = class(TForm)
    Edit1: TEdit;
    OraSession1: TOraSession;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation

uses ConnectForm, Unit1, Unit19;

{$R *.dfm}

procedure TForm18.FormShow(Sender: TObject);
var tx:string;
begin
//Orasession1.Name:='nordsy';
//Orasession1.Password:='ncd';
Orasession1.Server:='troya';
Form18.Orasession1.Connect;

tx:=    'Select tx.texkompl_id,    ';
tx:=tx+'nvl(nordsy.summ_nar_tx(tx.texkompl_id),0) sum_nar, ';
tx:=tx+'nvl( nordsy.trud_tx( tx.texkompl_id),0) sum_tex,     ';
tx:=tx+'(Select sum(decode(otk_end,null,0,DECODE(user_prb,null,0,trudoem)))       ';
tx:=tx+'from tx_texkompl                                                             ';
tx:=tx+'connect by prior texkompl_id = texkompl_texkompl_ID                           ';
tx:=tx+'start	with  texkompl_texkompl_ID=tx.texkompl_id) prb  ,         ';
tx:=tx+'(Select nomer from tx_texkompl where texkompl_id=tx.texkompl_id) nomer,       ';
tx:=tx+'(Select name from tx_texkompl where texkompl_id=tx.texkompl_id) name,       ';
tx:=tx+'(Select DECODE(otk_end,null,NULL,otk_end) from tx_texkompl where texkompl_id=tx.texkompl_id) otk_end ';
tx:=tx+'from ';
tx:=tx+'(Select texkompl_id,type_tex_type_tex_id from ';
tx:=tx+'(Select texkompl_id,type_tex_type_tex_id from tx_texkompl ';
tx:=tx+'connect by prior texkompl_id = texkompl_texkompl_ID        ';
tx:=tx+'start	with  texkompl_texkompl_ID='''+Edit1.Text+''')';
tx:=tx+'where type_tex_type_tex_id in (11)) tx                    ';
 // showMessage(tx);
 oraQuery1.SQL.text:=tx;
 oraQuery1.ExecSQL;


end;

procedure TForm18.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   oraQuery1.Close;
end;

procedure TForm18.DBGridEh1DblClick(Sender: TObject);
begin
form19.Label1.Caption:=oraQuery1.FieldByName('texkompl_id').asString;
form19.Caption:='Отчет по трудоемкости по '+ oraQuery1.FieldByName('nomer').asString;
form19.ShowModal();
end;

end.
