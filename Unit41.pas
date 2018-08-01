unit Unit41;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, DBAccess, Ora, MemDS;

type
  TForm41 = class(TForm)
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
    isp_plan_was:string;
  end;

var
  Form41: TForm41;

implementation

uses Unit36;

{$R *.dfm}

procedure TForm41.FormShow(Sender: TObject);
var tx:string;
begin
 tx:='';
  tx:=tx+'  SELECT DISTINCT F.FIRM_ID ID,F.IDENT   NAME_sh, F.Name name_full  ';
  tx:=tx+'  FROM TRONIX_FIRM F,TRONIX_TTN T ';
  tx:=tx+'   WHERE F.FIRM_ID = T.POST_POST_ID_NAR ';
  tx:=tx+'  union all ';
  tx:=tx+'  Select dep_id ID,  nomer NAME_sh, Name name_full ';
  tx:=tx+'  from nordsy.dep ';
  tx:=tx+'  where type_dep_type_dep_id=2 ';
  tx:=tx+'  ORDER BY NAME_sh ';
   OraQuery1.SQL.Text:=tx;
    OraQuery1.ExecSQL;
end;

procedure TForm41.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    OraQuery1.Close;
end;

procedure TForm41.DBGridEh1DblClick(Sender: TObject);
var god:integer;
begin

if  isp_plan_was<>OraQuery1.FieldByName('NAME_sh').AsString then
begin
     god:=1;
     if Form36.MEMTableEh1.ReadOnly=true then
      begin
     Form36.OraQuery1.ReadOnly:=false;
     Form36.MEMTableEh1.ReadOnly:=false;
     god:=0;
      end;
     Form36.DBGridEH1.DataSource.DataSet.edit;
     Form36.DBGridEH1.datasource.DataSet.FieldByName('NAME_firm_plan').AsString := OraQuery1.FieldByName('NAME_sh').AsString;
     Form36.dbgridEH1.DataSource.DataSet.Post;
     if god=0 then
      begin
     Form36.MEMTableEh1.ReadOnly:=true;
     Form36.OraQuery1.ReadOnly:=true;
      end;
end;

  Form41.Close;
end;

end.
