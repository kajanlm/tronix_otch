unit Unit56;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TForm56 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1nomer: TStringField;
    OraQuery1name: TStringField;
    OraQuery1namek: TStringField;
    OraQuery1kol: TFloatField;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form56: TForm56;

implementation

uses Unit9,Unit55;

{$R *.dfm}

procedure TForm56.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='603887';
//Edit2.Text:=StrToInt(Edit2.Text);
//ShowMessage(Edit3.Text);
tx:=tx+' select tx.nomer nomer,replace(replace(tx.name, CHR(13)||CHR(10),'' ''),chr(39), '' '') name, '''+edit3.Text+''' namek,';
if edit3.text='ØÒ' then
begin
tx:=tx+'round(tm.kol,0) kol';
end
else
tx:=tx+'round(tm.kol,1) kol';

tx:=tx+' from nordsy.texkompl tx,nordsy.texkompl tk,nordsy.tx_mat tm,nordsy.type_relation_poz typ,tronix.project_list pr,feb_zakaz z';

tx:=tx+' where nvl(nordsy.go_in_tk(tm.tex_texkompl_id,''ÏÓÅ'',''TYPE''),tm.tex_texkompl_id)=tx.texkompl_id';
tx:=tx+' and tx.texkompl_texkompl_id=tk.texkompl_id and tk.nomer=''ÒÍÀ''';
tx:=tx+' and tm.type_relation_type_relation_id=typ.type_relation_poz_id and typ.key=''03''';
tx:=tx+' and nordsy.uzak_tx(tx.texkompl_id)=z.nn';
tx:=tx+' and tx.project_project_id=pr.project_id(+) and pr.project_id='+Edit1.Text;
tx:=tx+' and upper(z.zak) like (''%ÌÑ×%'') and tm.sp_sp_id is null';
tx:=tx+' and tm.sprav_sprav_id='+Edit2.Text;
tx:=tx+' order by tx.nomer';
//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('nomer').DisplayLAbel:='ÒÍ ';
        FieldByName('name').DisplayLAbel:='ÍÀÈÌÅÍÎÂÀÍÈÅ ';
        FieldByName('namek').DisplayLAbel:='ÅÄ.ÈÇÌ. ';
        FieldByName('kol').DisplayLAbel:='ÈÇÃÎÒÎÂÈÒÜ ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TForm56.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;


procedure TForm56.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
      if (Column.FieldName='kol') and (Column.Field.Dataset.FieldByName('kol').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
end.
