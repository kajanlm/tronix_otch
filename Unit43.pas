unit Unit43;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, DBAccess, Ora, MemDS, StdCtrls;

type
  TForm43 = class(TForm)
    Label1: TLabel;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form43: TForm43;

implementation

uses Unit44;

{$R *.dfm}

procedure TForm43.FormShow(Sender: TObject);
begin


OraQuery1.SQL.Add('Select texkompl_id, nomer, name from tx_texkompl');
OraQuery1.SQL.Add(' where nomer like ''100-Ç%'' and project_project_id='+Label2.Caption);
OraQuery1.SQL.Add(' and type_tex_type_tex_id=7 ');
OraQuery1.SQL.Add(' order by nomer ');
OraQuery1.ExecSQL;

end;

procedure TForm43.FormClose(Sender: TObject; var Action: TCloseAction);
begin
OraQuery1.SQL.Clear;
OraQuery1.Close;
Label2.Caption:='';
end;

procedure TForm43.DBGridEh1DblClick(Sender: TObject);
begin
 //ShowMessage(OraQuery1.FieldByName('texkompl_id').AsString);
 Form44.Label1.Caption:=OraQuery1.FieldByName('texkompl_id').AsString;
 Form44.Caption:=Form43.Caption+' '+ OraQuery1.FieldByName('nomer').AsString ;
 Form44.ShowModal();
end;

end.
