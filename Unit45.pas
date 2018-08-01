unit Unit45;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, Ora, OleServer, ExcelXP,ComObj,ComCtrls,
  MemTableDataEh, MemTableEh, GridsEh, DBGridEh, DataDriverEh,EhLibADO;

type
  TForm45 = class(TForm)
    Label1: TLabel;
    OraQuery1: TOraQuery;
    Label2: TLabel;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelApplication2: TExcelApplication;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    OraQuery2: TOraQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form45: TForm45;

implementation

uses Unit46;

{$R *.dfm}

procedure TForm45.FormShow(Sender: TObject);
var tx,tx1: string;
FExcel, WorkBook, SheetActive, Sheet, Colum : OleVariant;
e,a,e1,counter:integer;
begin

tx:='Select e.sprav_id , e.texkompl_id,e.nomer, e.n_poz_tn, e.kod,e.sname,';
tx:=tx+' op.nomer||'' ''||op.text nop, op.trud_msc trud , op.fl_end_trud,(Select nomer from nordsy.dep where dep_id=op.dep_dep_id) cex ';
tx:=tx+' from (';
tx:=tx+'  Select sprav_id , texkompl_id,nomer, n_poz_tn, kod,tronix_sp_name(sprav_id) sname ';
tx:=tx+' from tx_texkompl, nordsy.tx_mat, tronix.sprav sp ';
tx:=tx+' where ';
if form46.CheckBox1.Checked=true then
   begin
tx:=tx+' texkompl_id in ( ';
tx:=tx+' Select texkompl_id from tx_texkompl ';
tx:=tx+' connect by prior texkompl_id=texkompl_texkompl_id ';
tx:=tx+' start with texkompl_id = (Select texkompl_id from tx_texkompl where nomer= ''ТНА'' and project_project_id='+Label1.Caption+')) ';
tx:=tx+'  and texkompl_id=tex_texkompl_id ';
tx:=tx+'  and  sprav_sprav_id=sp.sprav_id ';
tx:=tx+'  and  can_do_self = 1 ';
tx:=tx+'  and type_relation_type_relation_id=9) e ';
end
else
begin
tx:=tx+' texkompl_id ='+Label3.Caption ;
tx:=tx+'  and texkompl_id=tex_texkompl_id ';
tx:=tx+'  and  sprav_sprav_id=sp.sprav_id ';
tx:=tx+'  and  can_do_self = 1 ';
tx:=tx+'  and type_relation_type_relation_id=9 ) e';
end;
tx:=tx+' , ';
tx:=tx+' TX_Ztexnologi z,nordsy.operation op ';
tx:=tx+' where ';
tx:=tx+'  z.SPRAV_SPRAV_ID (+) = sprav_id ';
tx:=tx+' and z.ztexnologi_id=op.ztexnologi_ztexnologi_id(+) ';


tx:=tx+' order by nomer,decode(translate(n_poz_tn, ''_0123456789'', ''_''), null, to_number(n_poz_tn),n_poz_tn) ';



OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;   a:=1;


if OraQuery1.RecordCount>0 then
 begin
   FExcel:=CreateOleObject('Excel.Application');
   FExcel.EnableEvents := False;
   FExcel.Visible:=false;
   FExcel.Workbooks.Add(-4167);
   FExcel.Workbooks[1].WorkSheets[1].Name:=Label2.Caption;
   Colum:=FExcel.Workbooks[1].WorkSheets[Label2.Caption].Columns;

   Colum.Columns[1].ColumnWidth:=20;
   Colum.Columns[2].ColumnWidth:=20;
   Colum.Columns[3].ColumnWidth:=100;
   Colum.Columns[4].ColumnWidth:=20;
   Colum.Columns[5].ColumnWidth:=18;
   Colum.Columns[6].ColumnWidth:=10;

   Sheet:=FExcel.Workbooks[1].WorkSheets[Label2.Caption];

   Sheet.Cells[1,1]:='                             Незаполненая трудоемкость  МСЧ '+label2.Caption+' на '+datetoStr(now());
Sheet.Cells[1,1].Font.Bold := True;
Sheet.Cells[1,1].Font.Size := Sheet.Cells[1,2].Font.Size+5;
Sheet.Cells[2,1]:='№ ТНа';
Sheet.Cells[2,1].Font.Bold := True;
Sheet.Cells[2,1].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,2]:='Код изделия';
Sheet.Cells[2,2].Font.Bold := True;
Sheet.Cells[2,2].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,3]:='Наименование';
Sheet.Cells[2,3].Font.Bold := True;
Sheet.Cells[2,3].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,4]:='Трудоемкость';
Sheet.Cells[2,4].Font.Bold := True;
Sheet.Cells[2,4].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,5]:='№ операции';
Sheet.Cells[2,5].Font.Bold := True;
Sheet.Cells[2,5].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,6]:='Цех';

Sheet.Cells[2,6].Font.Bold := True;
Sheet.Cells[2,6].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,7]:='Признак';
Sheet.Cells[2,7].Font.Bold := True;
Sheet.Cells[2,7].Font.Size := Sheet.Cells[1,1].Font.Size-3;

//Sheet.Cells[2,8]:='NEN';
//Sheet.Cells[2,8].Font.Bold := True;
//Sheet.Cells[2,8].Font.Size := Sheet.Cells[1,1].Font.Size-3;

Sheet.range[Sheet.cells[2,1],Sheet.cells[2,7]].borders.weight:=3;

e:=1;
OraQuery1.First;
 counter:=1;
While e<=OraQuery1.RecordCount Do
 Begin
      Sheet.Cells[counter+2,1]:=OraQuery1.FieldByName('nomer').AsString+' поз '+OraQuery1.FieldByName('n_poz_tn').AsString;
            Sheet.Cells[counter+2,2].NumberFormat:= '@';
      Sheet.Cells[counter+2,2]:=OraQuery1.FieldByName('kod').AsString;
      Sheet.cells[counter+2,2].VerticalAlignment := xlCenter;
          Sheet.cells[counter+2,2].HorizontalAlignment := xlCenter;
      Sheet.Cells[counter+2,3]:=OraQuery1.FieldByName('sname').AsString;
            Sheet.Cells[counter+2,6].NumberFormat:= '@';
             Sheet.Cells[counter+2,4]:=OraQuery1.FieldByName('trud').AsString;
             Sheet.Cells[counter+2,5]:=OraQuery1.FieldByName('nop').AsString;
               Sheet.Cells[counter+2,6].NumberFormat:= '@';
              Sheet.Cells[counter+2,6]:=OraQuery1.FieldByName('cex').AsString;
              Sheet.Cells[counter+2,7]:=OraQuery1.FieldByName('fl_end_trud').AsString;
    counter:=counter+1;
tx1:=' Select sprav,sprav_sost,sname, (Select kod from tronix.sprav where sprav_id=sprav_sost) kod, ';
tx1:=tx1+' op.nomer||'' ''||op.text nop, op.trud_msc trud , op.fl_end_trud,(Select nomer from nordsy.dep where dep_id=op.dep_dep_id) cex';
tx1:=tx1+' from (';
tx1:=tx1+'  Select  sprav,sprav_sost,lpad(''*'',(lev),''*'') || to_char(tronix_sp_name(sprav_sost)) sname, can_do_Self';
tx1:=tx1+'   from (';
tx1:=tx1+'   Select sprav_sprav_id sprav, sprav_sprav_id_sostav sprav_sost, level lev';
tx1:=tx1+'   from tronix.sostav';
tx1:=tx1+'  connect by  prior sprav_sprav_id_sostav=sprav_sprav_id';
tx1:=tx1+'   start with sprav_sprav_id='+OraQuery1.FieldByName('sprav_id').AsString+' ),';
tx1:=tx1+' tronix.sprav';
tx1:=tx1+' where can_do_self =1';
tx1:=tx1+' and sprav_id=sprav_sost)';
tx1:=tx1+' , ';
tx1:=tx1+' TX_Ztexnologi z,nordsy.operation op';
tx1:=tx1+' where ';
tx1:=tx1+'  z.SPRAV_SPRAV_ID (+) = sprav_sost ';
tx1:=tx1+' and z.ztexnologi_id=op.ztexnologi_ztexnologi_id(+) ';


 OraQuery2.SQL.Text:=tx1;
OraQuery2.ExecSQL;
e1:=1;
OraQuery2.First;
 While e1<=OraQuery2.RecordCount Do
 begin
            Sheet.Cells[counter+2,1]:=OraQuery1.FieldByName('nomer').AsString+' поз '+OraQuery1.FieldByName('n_poz_tn').AsString;
            Sheet.Cells[counter+2,2].NumberFormat:= '@';
            Sheet.Cells[counter+2,2]:=OraQuery2.FieldByName('kod').AsString;
            Sheet.cells[counter+2,2].VerticalAlignment := xlCenter;
            Sheet.cells[counter+2,2].HorizontalAlignment := xlCenter;
            Sheet.Cells[counter+2,3]:=OraQuery2.FieldByName('sname').AsString;
             Sheet.Cells[counter+2,4]:=OraQuery2.FieldByName('trud').AsString;
             Sheet.Cells[counter+2,5]:=OraQuery2.FieldByName('nop').AsString;
               Sheet.Cells[counter+2,6].NumberFormat:= '@';
              Sheet.Cells[counter+2,6]:=OraQuery2.FieldByName('cex').AsString;
              Sheet.Cells[counter+2,7]:=OraQuery2.FieldByName('fl_end_trud').AsString;
///////////////////////////////////////////////////////
//              Sheet.Cells[counter+2,8]:=OraQuery2.FieldByName('rab').AsString;
//               Sheet.Cells[counter+2,9]:=OraQuery2.FieldByName('zt').AsString;
//                Sheet.Cells[counter+2,10]:=OraQuery1.FieldByName('sprav_id').AsString;
    counter:=counter+1;
      inc (e1); OraQuery2.Next;
 end;
     inc (e); OraQuery1.Next;
 end;



       Sheet.range[Sheet.cells[1,1],Sheet.cells[counter+2,6]].VerticalAlignment := xlCenter;
  //    Sheet.range[Sheet.cells[2,1],Sheet.cells[counter+2,6]].HorizontalAlignment := xlCenter;
       Sheet.range[Sheet.cells[2,1],Sheet.cells[counter+2,6]].WrapText := true;

 FExcel.Visible:=true;
  Form45.Close;

 end;
end;

procedure TForm45.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    OraQuery1.Close;
    LAbel1.Caption:='';
        LAbel2.Caption:='';
          LAbel3.Caption:='';
          OraQuery2.Close;

end;

end.
