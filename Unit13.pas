unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, GridsEh;

type
  TForm13 = class(TForm)
    DBGridEh1: TDBGridEh;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses Unit12, Unit14;

{$R *.dfm}

procedure TForm13.FormShow(Sender: TObject);
var tx:string;
begin
tx:='Select td.document_id, td.ident, name, td.Litera, td.id_document_izv,   ';
tx:=tx+' (Select Name from  tronix.document_type where td.id_document_type=Document_type_id) type_doc, ';
tx:=tx+' (Select NAme from tronix.document_group where td.id_document_group=document_group_id and td.id_document_type=id_document_type) group_doc ';
tx:=tx+' from tronix.document td';
tx:=tx+' where id_project='+#39+Form12.oraQuery1.FieldByName('project_id').asString+#39;


OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;
end;

procedure TForm13.DBGridEh1DblClick(Sender: TObject);
begin
form14.Label1.Caption:=oraQuery1.FieldByName('document_id').asString;
form14.ShowModal();
end;

end.
