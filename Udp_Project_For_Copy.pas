unit Udp_Project_For_Copy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComCtrls,ComObj;

type
  TFUdp_Project_For_Copy = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1chk_fld: TStringField;
    OraQuery1zavn: TStringField;
    OraQuery1name: TStringField;
    OraQuery1idpr: TIntegerField;
    OraQuery1proekt: TStringField;
    Edit1: TEdit;
    Edit2: TEdit;
    SaveDialog1: TSaveDialog;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    OraQuery2: TOraQuery;
    OraQuery4: TOraQuery;
    OraQuery4udp: TStringField;
    OraQuery4name: TStringField;
    OraQuery4datend: TStringField;
    OraQuery4idudp: TFloatField;
    CheckBox1: TCheckBox;
   procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
 private
    { Private declarations }
  procedure SelectProject;
  public
    { Public declarations }
  end;

var
  FUdp_Project_For_Copy: TFUdp_Project_For_Copy;
implementation

uses Unit9,Udp_Zakazchik,Udp_Zakazchik_InsUdp;


{$R *.dfm}
procedure TFUdp_Project_For_Copy.SelectProject;
var tx: string;
begin
tx:='';
tx:=tx+'select t.chk_fld as chk_fld, t.zavn as zavn,t.name as name,t.idpr as idpr,t.proekt as proekt from(';
tx:=tx+'select ''0'' chk_fld, pr.zavn zavn,pr.name name,pr.project_id idpr,pr.proekt proekt from tronix.project_list pr';
tx:=tx+' where pr.date_end is null';

if CheckBox1.Checked=false then
begin
tx:=tx+'  and pr.proekt='''+edit3.text;
tx:=tx+''' and pr.zavn<>'''+edit2.text;
tx:=tx+''' and length(trim(pr.proekt))=length(trim('''+edit3.text+'''))';
end;
tx:=tx+' ) t';
tx:=tx+' order by t.zavn';
//ShowMessage(tx);
   OraQuery1.Close;
  With OraQuery1 Do
     begin
        FieldByName('chk_fld').DisplayLAbel:='Отметка';
        FieldByName('zavn').DisplayLAbel:='Зав.№';
        FieldByName('name').DisplayLAbel:='Наименование';
        FieldByName('idpr').DisplayLAbel:='idpr';
        FieldByName('proekt').DisplayLAbel:='proekt';
    end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;

procedure TFUdp_Project_For_Copy.FormShow(Sender: TObject);
var tx: string;
begin
//Edit1.Text:='458';
//ShowMessage('Copy from zakazchik');
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);
//ShowMessage(Edit3.Text);
//ShowMessage(Udp_Zakazchik.Edit3.Text);


SelectProject;

end;


procedure TFUdp_Project_For_Copy.CheckBox1Click(Sender: TObject);
begin
SelectProject;
end;

end.

