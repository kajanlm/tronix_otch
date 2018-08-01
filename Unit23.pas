unit Unit23;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, Ora;

type
  TForm23 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    OraQuery1: TOraQuery;
    procedure Edit1DblClick(Sender: TObject);
    procedure Edit2DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit3DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form23: TForm23;

implementation

uses Unit9, Unit10, Unit24;

{$R *.dfm}

procedure TForm23.Edit1DblClick(Sender: TObject);
begin
        form9.Caption:='Выберите что сравниваем';
                 Form23.Label3.Caption:='';
         Form23.Edit3.Text:='';
  form9.ShowModal();
end;

procedure TForm23.Edit2DblClick(Sender: TObject);
begin
         form9.Caption:='Выберите с чем сравниваем';
  form9.ShowModal();
end;

procedure TForm23.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form23.Edit1.Text:='';
  Form23.Edit2.Text:='';
  Form23.Edit3.Text:='';
  Form23.Label1.Caption:='';
  Form23.Label2.Caption:='';
  Form23.Label3.Caption:='';
  OraQuery1.Close;
end;

procedure TForm23.Edit3DblClick(Sender: TObject);
begin
           form10.Caption:='Выберите УКР';
           Form10.Label1.caption:=Label1.Caption;
  form10.ShowModal();
end;

procedure TForm23.Button1Click(Sender: TObject);
var tx,texkompl_look:string;
begin
    OraQuery1.SQL.Text:='Select texkompl_id  from  tx_texkompl where nomer='+#39+Edit3.Text+#39+
    ' and  project_project_id=(Select id_project from tronix.zakaz where nn='+Label2.caption+')';

     OraQuery1.ExecSQL;
     If OraQuery1.RecordCount>0 then
     begin
texkompl_look:=OraQuery1.FieldByName('texkompl_id').AsString;
tx:='   Select (Select nomer from tx_texkompl where texkompl_id=tx.texkompl_id) nomer,(Select kod from nordsy.type_tex where type_tex_id=tx.type_tex_type_tex_id) kod,  ';
tx:=tx+' (Select name from tx_texkompl where texkompl_id=tx.texkompl_id) name,(Select zavn from tronix.project_list where project_id=(Select project_project_id from tx_texkompl where texkompl_id=tx.texkompl_id)) project, ';
tx:=tx+' tx.texkompl_id tk, (Select FIO from tronix.izm where tname=''TEXKOMPL'' and id=tx.texkompl_id and izm=''I'' and id_project=(Select project_project_id from tx_texkompl where texkompl_id=tx.texkompl_id)) FIO,';
tx:=tx+' (Select DAT from tronix.izm where tname=''TEXKOMPL'' and id=tx.texkompl_id and izm=''I'' and id_project=(Select project_project_id from tx_texkompl where texkompl_id=tx.texkompl_id)) DAT ';
tx:=tx+' from  ';
tx:=tx+'(      ';
tx:=tx+'Select texkompl_id, type_tex_type_tex_id ';
tx:=tx+'from  ';
tx:=tx+'(  ';
tx:=tx+'Select nomer ';
tx:=tx+' from     ';
tx:=tx+'(           ';
tx:=tx+' Select nomer,sum(pr) spr from ';
tx:=tx+' (            ';
tx:=tx+' Select nomer,1 pr  from tx_texkompl ';
tx:=tx+' connect by prior texkompl_id = texkompl_texkompl_ID ';
tx:=tx+'         start with  texkompl_ID ='+Label3.Caption;
tx:=tx+' union all    ';
tx:=tx+' Select nomer,1 pr  from tx_texkompl ';
tx:=tx+' connect by prior texkompl_id = texkompl_texkompl_ID ';
tx:=tx+'         start with  texkompl_ID = '+texkompl_look;
tx:=tx+' ) ';
tx:=tx+' group by nomer ';
tx:=tx+' ) ';
tx:=tx+' where spr=1 ';
tx:=tx+' ) n, tx_texkompl tx ';
tx:=tx+' where tx.nomer= n.nomer  ';
tx:=tx+' and  tx.project_project_id in (Select project_project_id from tx_texkompl where texkompl_id in ('+Label3.Caption+' ,'+texkompl_look+' )) ';
tx:=tx+' ) tx  ';

     Form24.OraQuery1.SQL.Text:=tx;


      form24.ShowModal();

     End;

end;

end.
