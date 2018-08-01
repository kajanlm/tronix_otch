unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, GridsEh;

type
  TForm14 = class(TForm)
    Label1: TLabel;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

uses Unit13;

{$R *.dfm}

procedure TForm14.FormShow(Sender: TObject);
var tx: String;
begin
tx:=' Select sp.poz, sp.name, sp.obozn,sp.kod, sp.kol,sp.nn, up_NN, ';
tx:=tx+'( Select Name from  tronix.sprav where sprav_id=sp.id_sprav) sprav ,';
tx:=tx+'( Select sprav_id from  tronix.sprav where sprav_id=sp.id_sprav) sprav1 ';
tx:=tx+' from tronix.sp sp';
tx:=tx+' where sp.NNN='+#39+Form13.oraQuery1.FieldByName('document_id').asString+#39;
tx:=tx+' and sp.up_nn is null ';
tx:=tx+' order by sp.poz      ';

OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;
end;

procedure TForm14.DBGridEh1DblClick(Sender: TObject);
var tx: String;
begin
tx:=' Select sp.poz, sp.name, sp.obozn,sp.kod,sp.kol,sp.nn, up_NN,';
tx:=tx+'( Select Name from  tronix.sprav where sprav_id=sp.id_sprav) sprav ,';
tx:=tx+'( Select sprav_id from  tronix.sprav where sprav_id=sp.id_sprav) sprav1 ';
tx:=tx+' from tronix.sp sp';
tx:=tx+' where sp.up_nn='+#39+oraQuery1.FieldByName('NN').asString+#39;
tx:=tx+' order by sp.poz      ';

OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;
end;

procedure TForm14.Button2Click(Sender: TObject);
begin
  DBGridEh1DblClick(nil);
end;

procedure TForm14.Button1Click(Sender: TObject);
var tx: String;
begin
tx:=' Select sp.poz, sp.name, sp.obozn,sp.kod,sp.kol,sp.nn,sp.up_NN,  ';
tx:=tx+'( Select Name from  tronix.sprav where sprav_id=sp.id_sprav) sprav ,';
tx:=tx+'( Select sprav_id from  tronix.sprav where sprav_id=sp.id_sprav) sprav1 ';
tx:=tx+'from tronix.sp sp,';
tx:=tx+' (Select up_nn from tronix.sp where nn='+#39+oraQuery1.FieldByName('up_NN').asString+#39;
tx:=tx+' ) nn1';
tx:=tx+' where sp.up_nn=nn1.up_nn ';
tx:=tx+' order by sp.poz      ';
OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;

end;

end.
