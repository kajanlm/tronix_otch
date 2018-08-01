unit Unit21;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Ora, StdCtrls, Grids, DBGridEh;

type
  TForm21 = class(TForm)
    OraDataSource1: TOraDataSource;
    OraQuery1: TOraQuery;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

implementation

{$R *.dfm}

procedure TForm21.FormShow(Sender: TObject);
vaR  tx:string;
begin
 tx:='Select texkompl_id, nomer,name,pdate_beg,pdate_end ';
tx:=tx+'from tx_texkompl ';
tx:=tx+'where type_tex_type_tex_id=7 ';
tx:=tx+'and  project_project_id='+EDIT1.text;
tx:=tx+' and pdate_end between  trunc(sysdate,''mm'')  and last_day(sysdate) ';
tx:=tx+' and otk_end is  null';
  oraQuery1.SQL.Text:=tx;
 oraQuery1.ExecSQL;
ShowMessage(IntToStr(OraQuery1.RecordCount));


end;

end.
