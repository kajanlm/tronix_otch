unit Unit46;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, DBAccess, Ora, MemDS, StdCtrls;

type
  TForm46 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form46: TForm46;

implementation

uses Unit45;

{$R *.dfm}

procedure TForm46.FormShow(Sender: TObject);
var tx:string;
begin
tx:='Select nomer, name, texkompl_id from ';
tx:=tx+' tx_texkompl';
tx:=tx+' where project_project_id= '+Label1.Caption;
tx:=tx+'  and type_tex_type_tex_id=8 ';
tx:=tx+' and texkompl_texkompl_id=(Select texkompl_id from tx_texkompl where nomer= ''“Õ¿'' and project_project_id='+Label1.Caption+')';
tx:=tx+'  order by nomer ';
OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;

end;

procedure TForm46.DBGridEh1DblClick(Sender: TObject);
begin
Form45.Label1.Caption:=Label1.Caption;
Form45.Label2.Caption:=Label2.Caption;
Form45.Label3.Caption:=oraQuery1.FieldByName('texkompl_id').asString;
Form45.Caption:=Form46.Caption;
 Form45.ShowModal();
end;

procedure TForm46.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    OraQuery1.Close;
    LAbel1.Caption:='';
        LAbel2.Caption:='';

end;

procedure TForm46.Button1Click(Sender: TObject);
begin
    Form46.DBGridEh1DblClick(nil);
end;

end.
