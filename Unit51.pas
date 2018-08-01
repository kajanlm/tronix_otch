unit Unit51;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MemTableDataEh, Db, DataDriverEh, MemTableEh, GridsEh,
  DBGridEh, DBAccess, Ora, MemDS;

type
  TForm51 = class(TForm)
    Label1: TLabel;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    MemTableEh1: TMemTableEh;
    DataSetDriverEh1: TDataSetDriverEh;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form51: TForm51;

implementation

{$R *.dfm}

procedure TForm51.FormShow(Sender: TObject);
var tx:string;
begin
with dbGridEh1.Columns.Add do
   begin
        FieldName := 'poz';
   Title.Caption :='Позиция';
    Width:=100;
   end;
with dbGridEh1.Columns.Add do
   begin
        FieldName := 'KOD';
   Title.Caption :='Код';
    Width:=100;
   end;

with dbGridEh1.Columns.Add do
   begin
        FieldName := 'KODE';
   Title.Caption :='Ед.';
    Width:=30;
   end;

with dbGridEh1.Columns.Add do
   begin
        FieldName := 'KOl';
   Title.Caption :='Кол-во';
    Width:=50;
   end;


with dbGridEh1.Columns.Add do
   begin
        FieldName := 'mass';
   Title.Caption :='Масса';
    Width:=50;
   end;

with dbGridEh1.Columns.Add do
   begin
        FieldName := 'name1';
   Title.Caption :='Наименование';
    Width:=400;
   end;

with dbGridEh1.Columns.Add do
   begin
        FieldName := 'ggost';
   Title.Caption :='Обозначение';
    Width:=100;
   end;


with dbGridEh1.Columns.Add do
   begin
        FieldName := 'kode_tx';
   Title.Caption :='Ед. тех.';
    Width:=50;
   end;


with dbGridEh1.Columns.Add do
   begin
        FieldName := 'kol_tx';
   Title.Caption :='Кол. тех.';
    Width:=50;
   end;


tx:='Select doc.ident,doc.name, poz||'' ''||podpoz poz,Decode(sp.kode,null,(select namek from tronix.koded where koded_id=(select koded_id from tronix.sprav where sprav_id=id_sprav)),sp.kode) kode,';
tx:=tx+'decode(sp.kod,null,(Select kod from tronix.sprav where sprav_id=id_sprav),sp.kod) kod,kol,sp.prim,';
tx:=tx+' (Select name from tronix.typ_lov where typ_lov_id=(Select typ_lov_typ_lov_id from tronix.sprav where sprav_id=id_sprav)) ggost,';
tx:=tx+' sp.name||'' ''||tronix.sp_name(id_sprav) as name1,';
tx:=tx+' mass,nn,up_nn,sp.kol_tx,sp.kode_tx, type_str';
tx:=tx+' from ';
tx:=tx+' tronix.document doc, tronix.sp sp ';
tx:=tx+' where ';
tx:=tx+' doc.document_id=nnn ';
tx:=tx+' and doc.document_id='+Label1.Caption;
//tx:=tx+'order by decode(translate(poz, ''_0123456789'', ''_''), null, poz, poz) ';
tx:=tx+' order by poz,type_str ';
   OraQuery1.SQL.Text:=tx;
   OraQuery1.ExecSQL;
 MemTableEh1.Active:=true;
end;

procedure TForm51.Button1Click(Sender: TObject);
 var f: textfile;
 to_file:string;
begin
   SaveDialog1.Filter:='Танспорт|*.tr';
  SaveDialog1.FileName:=Caption+'.tr';
if SaveDialog1.Execute then
begin
AssignFile(F,SaveDialog1.FileName);
Rewrite(F);

MemTableEh1.TreeList.FullExpand;
MemTableEh1.First;
      While   NOT DBGRIDEH1.DataSource.DataSet.Eof Do
        begin
            to_file:=DbgridEh1.DataSource.DataSet.FieldByName('poz').asString+chr(9)+''+chr(9)+
            DbgridEh1.DataSource.DataSet.FieldByName('kod').asString+chr(9)+
            DbgridEh1.DataSource.DataSet.FieldByName('name1').asString+chr(9)+
            DbgridEh1.DataSource.DataSet.FieldByName('kode').asString+chr(9)+
            DbgridEh1.DataSource.DataSet.FieldByName('kol').asString+chr(9)+''+chr(9)+
            DbgridEh1.DataSource.DataSet.FieldByName('mass').asString+
            chr(9)+''+chr(9)+
            chr(9)+''+chr(9)+
            chr(9)+''+chr(9);

             writeLn(f,to_file);
            DBGRIDEH1.DataSource.DataSet.Next;
        end;




 closefile(f);
end;
 //       writeLn(f,to_file);

 end;
end.
