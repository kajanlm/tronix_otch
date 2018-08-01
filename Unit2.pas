unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, MemDS, DBAccess, Ora, ExcelXP, OleServer,ComObj,
  OraSmart;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Button3: TButton;
    ProgressBar1: TProgressBar;
    Label3: TLabel;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelApplication1: TExcelApplication;
    OraQuery1: TOraQuery;
    OraQuery2: TOraQuery;
    procedure Edit1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    { Public declarations }
      up_level:string;
  end;

var
  Form2: TForm2;

implementation

uses Unit3, Unit4, Unit5, Unit6;

{$R *.dfm}

procedure TForm2.Edit1DblClick(Sender: TObject);
begin
 Form3.ShowModal;
end;

procedure TForm2.Button1Click(Sender: TObject);
var tx,tx1, stroka:string;
 FExcel, WorkBook, SheetActive, Sheet,Colum : OleVariant;
 index:integer;
begin
 if  Caption='Ведомость по комплектации сводная!' then
   begin
 Form6.Caption:='Ведомость по комплектации сводная по '+Edit1.Text+' '+Edit2.Text;
 Form6.Show;
 end;
if Caption='Отчёт по изделиям МСЧ' then
    begin
    FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents := False;
FExcel.Visible:=false;
FExcel.Workbooks.Add(-4167);
FExcel.Workbooks[1].WorkSheets[1].Name:=Caption;
Colum:=FExcel.Workbooks[1].WorkSheets[Caption].Columns;
Colum.Columns[1].ColumnWidth:=20;
Colum.Columns[2].ColumnWidth:=20;
Colum.Columns[3].ColumnWidth:=50;
Colum.Columns[4].ColumnWidth:=20;

Sheet:=FExcel.Workbooks[1].WorkSheets[Caption];

Sheet.Cells[1,1]:='                '+Caption;
Sheet.Cells[1,1].Font.Bold := True;
Sheet.Cells[1,1].Font.Size := Sheet.Cells[1,2].Font.Size+5;
Sheet.Cells[3,1]:='№ проекта   '+Edit1.Text;
Sheet.Cells[3,1].Font.Bold := True;
Sheet.Cells[3,1].Font.Size := Sheet.Cells[1,1].Font.Size-5;

Sheet.Cells[4,1]:='Номер ТНА';
Sheet.Cells[4,1].Font.Bold := True;
Sheet.Cells[4,1].Font.Size := Sheet.Cells[1,1].Font.Size-5;
Sheet.Cells[4,2]:='Код изделия МСЧ';
Sheet.Cells[4,2].Font.Bold := True;
Sheet.Cells[4,2].Font.Size := Sheet.Cells[1,1].Font.Size-5;
Sheet.Cells[4,3]:='Наименование изделия МСЧ';
Sheet.Cells[4,3].Font.Bold := True;
Sheet.Cells[4,3].Font.Size := Sheet.Cells[1,1].Font.Size-5;
Sheet.Cells[4,4]:='Кол-во изделий МСЧ';
Sheet.Cells[4,4].Font.Bold := True;
Sheet.Cells[4,4].Font.Size := Sheet.Cells[1,1].Font.Size-5;

Sheet.Cells[5,1]:='1';
Sheet.Cells[5,1].Font.Bold := True;
Sheet.Cells[5,1].Font.Size := Sheet.Cells[1,1].Font.Size-5;
Sheet.Cells[5,2]:='2';
Sheet.Cells[5,2].Font.Bold := True;
Sheet.Cells[5,2].Font.Size := Sheet.Cells[1,1].Font.Size-5;
Sheet.Cells[5,3]:='3';
Sheet.Cells[5,3].Font.Bold := True;
Sheet.Cells[5,3].Font.Size := Sheet.Cells[1,1].Font.Size-5;
Sheet.Cells[5,4]:='4';
Sheet.Cells[5,4].Font.Bold := True;
Sheet.Cells[5,4].Font.Size := Sheet.Cells[1,1].Font.Size-5;


Sheet.range[Sheet.cells[4,1],Sheet.cells[5,4]].borders.weight:=2;
 FExcel.Range[Sheet.cells[4,1],Sheet.cells[5,4]].Select;
 FExcel.Selection.VerticalAlignment:=xlCenter;
FExcel.Selection.HorizontalAlignment:=xlCenter;

     if  (Combobox1.Text='По всем') or (Combobox1.Text='') then
       begin
          if (Edit1.Text<>'') and  (Edit2.Text<>'')  then
            begin
              tx:='Select kol, (Select nomer from tx_texkompl where texkompl_id=tex_texkompl_id) nomer, ';
              tx:=tx+'  (Select kod from tronix.sprav where sprav_id=sprav_sprav_id) kod, ';
              tx:=tx+'  tronix_sp_name(sprav_sprav_id) name ';
              tx:=tx+'  from nordsy.tx_mat ';
              tx:=tx+'  where ';
              tx:=tx+'  type_relation_type_relation_id=9 ';
              tx:=tx+'  and ';
              tx:=tx+'  tex_texkompl_id in ';
              tx:=tx+'  ( ';
              tx:=tx+'  Select texkompl_id ';
              tx:=tx+'  from tx_texkompl ';
              tx:=tx+'  where type_tex_type_tex_id=8 ';
              tx:=tx+'  connect by prior texkompl_id=texkompl_texkompl_id ';
              tx:=tx+'  start with texkompl_id='+up_level;
              tx:=tx+'  ) ';
              tx:=tx+'  order by nomer ';
               OraQuery1.SQL.Text:=tx;
               OraQuery1.ExecSQL;
            end;
       end
         else
           begin
           if (Edit1.Text<>'') and  (Edit2.Text<>'')  then
               begin
               tx:='Select kol, (Select nomer from tx_texkompl where texkompl_id=tex_texkompl_id) nomer, ';
               tx:=tx+' (Select kod from tronix.sprav where sprav_id=sprav_sprav_id) kod, ';
               tx:=tx+' tronix_sp_name(sprav_sprav_id) name ';
               tx:=tx+' from nordsy.tx_mat ';
               tx:=tx+' where ';
               tx:=tx+' type_relation_type_relation_id=9 ';
               tx:=tx+' and ';
               tx:=tx+' tex_texkompl_id ='+ edit3.Text;
                OraQuery1.SQL.Text:=tx;
               OraQuery1.ExecSQL;
               end;
           end;

  if  OraQuery1.RecordCount>0 then
   index:=6;
    While not OraQuery1.Eof do
      begin
      Sheet.Cells[index,1]:=OraQuery1.FieldByName('nomer').asString;
      Sheet.Cells[index,2]:=OraQuery1.FieldByName('kod').asString;
      Sheet.Cells[index,3]:=OraQuery1.FieldByName('name').asString;
      Sheet.Cells[index,4]:=OraQuery1.FieldByName('kol').asString;
      FExcel.Range['A'+IntTostr(index)+':A'+IntTostr(index)].Select;
      FExcel.Selection.BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);
      FExcel.Range['B'+IntTostr(index)+':B'+IntTostr(index)].Select;
      FExcel.Selection.BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);
      FExcel.Range['C'+IntTostr(index)+':C'+IntTostr(index)].Select;
      FExcel.Selection.BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);
      FExcel.Range['D'+IntTostr(index)+':D'+IntTostr(index)].Select;
      FExcel.Selection.BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);
      OraQuery1.Next;
      inc(index);
     end;
      FExcel.Range['C5:C'+IntTostr(index-1)].Select;
      FExcel.Selection.WrapText:=True;
      FExcel.Range['A5:D'+IntTostr(index-1)].Select;
      FExcel.Selection.VerticalAlignment:=xlCenter;

     FExcel.Visible:=true;
    end;
 //*Edit3.Text:=Form3.OraQuery2.FieldByName('tex_id').AsString;

 if Caption='МСЧ (Россыпь) с составом по проекту' then
    begin
    //  ShowMessage(up_level);
        FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents := False;
FExcel.Visible:=false;
FExcel.Workbooks.Add(-4167);
FExcel.Workbooks[1].WorkSheets[1].Name:='Отчет';
Colum:=FExcel.Workbooks[1].WorkSheets['Отчет'].Columns;
Colum.Columns[1].ColumnWidth:=14.71;
Colum.Columns[2].ColumnWidth:=50;
Colum.Columns[3].ColumnWidth:=10;
Colum.Columns[4].ColumnWidth:=20;
Colum.Columns[5].ColumnWidth:=60;
Colum.Columns[6].ColumnWidth:=60;

Sheet:=FExcel.Workbooks[1].WorkSheets['Отчет'];

Sheet.Cells[1,1]:='                '+Caption;
Sheet.Cells[1,1].Font.Bold := True;
Sheet.Cells[1,1].Font.Size := Sheet.Cells[1,2].Font.Size+5;
Sheet.Cells[3,1]:=' '+Edit1.Text;
Sheet.Cells[3,1].Font.Bold := True;
Sheet.Cells[3,1].Font.Size := Sheet.Cells[1,1].Font.Size-5;

Sheet.Cells[4,1]:='Заказ';
Sheet.Cells[4,1].Font.Bold := True;
Sheet.Cells[4,1].Font.Size := Sheet.Cells[1,1].Font.Size-5;
Sheet.Cells[4,2]:='Номер чертежа';
Sheet.Cells[4,2].Font.Bold := True;
Sheet.Cells[4,2].Font.Size := Sheet.Cells[1,1].Font.Size-5;
Sheet.Cells[4,3]:='Номер позиции';
Sheet.Cells[4,3].Font.Bold := True;
Sheet.Cells[4,3].Font.Size := Sheet.Cells[1,1].Font.Size-5;
Sheet.Cells[4,4]:='Код позиции';
Sheet.Cells[4,4].Font.Bold := True;
Sheet.Cells[4,4].Font.Size := Sheet.Cells[1,1].Font.Size-5;
Sheet.Cells[4,5]:='Наименование позиции';
Sheet.Cells[4,5].Font.Bold := True;
Sheet.Cells[4,5].Font.Size := Sheet.Cells[1,1].Font.Size-5;
Sheet.Cells[4,6]:=' Состав, закодированной позиции';
Sheet.Cells[4,6].Font.Bold := True;
Sheet.Cells[4,6].Font.Size := Sheet.Cells[1,1].Font.Size-5;


Sheet.range[Sheet.cells[4,1],Sheet.cells[4,6]].borders.weight:=2;
 FExcel.Range[Sheet.cells[4,1],Sheet.cells[4,6]].Select;
 FExcel.Selection.VerticalAlignment:=xlCenter;
FExcel.Selection.HorizontalAlignment:=xlCenter;
FExcel.Selection.WrapText:=True;
FExcel.Selection.EntireRow.AutoFit;
tx:='Select ident, poz,sprav_sprav_id,kod,name from( ';
tx:=tx+' Select ident, poz,sprav_sprav_id, ';
tx:=tx+' (Select kod from tronix.sprav where sprav_id=sprav_sprav_id) kod, ';
tx:=tx+' tronix_sp_name(sprav_sprav_id) name, ';
tx:=tx+' texkompl ';
tx:=tx+' from tronix.document, ';
tx:=tx+' (Select nnn,poz,sprav_sprav_id ,texkompl ';
tx:=tx+' from tronix.sp, ';
tx:=tx+' ( ';
tx:=tx+' Select Sprav_sprav_id, tex_texkompl_id,kol,tex_texkompl_id as texkompl ';
tx:=tx+'  from nordsy.tx_mat ';
tx:=tx+' where ';
tx:=tx+' type_relation_type_relation_id in (9,10) ';
tx:=tx+' and (Select NVL(rossip,0) from tronix.sprav where sprav_id=sprav_sprav_id)<>0 ';
tx:=tx+' and tex_texkompl_id in ';
tx:=tx+' (Select texkompl_id from ';
tx:=tx+' tx_texkompl ';
tx:=tx+' connect by prior texkompl_id=texkompl_texkompl_id ';
tx:=tx+' start with texkompl_texkompl_id='+up_level+') ';
tx:=tx+' ) ';
tx:=tx+' where id_sprav=sprav_sprav_id ';
tx:=tx+' group by nnn,poz,sprav_sprav_id,texkompl) ';
tx:=tx+' where document_id=nnn ';
tx:=tx+' and id_project=(Select project_project_id from tx_texkompl where texkompl_id='+up_level+'))';
tx:=tx+' group by ident, poz,sprav_sprav_id, ';
tx:=tx+' kod , ';
tx:=tx+' name';

 OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;


  if  OraQuery1.RecordCount>0 then
   index:=5;
    While not OraQuery1.Eof do
      begin
      Sheet.Cells[index,1]:=Edit2.text;
      Sheet.Cells[index,2]:=OraQuery1.FieldByName('ident').asString;
      Sheet.Cells[index,3]:=OraQuery1.FieldByName('poz').asString;
      Sheet.Cells[index,4].WrapText := true;
      Sheet.Cells[index,4]:=OraQuery1.FieldByName('kod').asString;
      Sheet.Cells[index,5]:=OraQuery1.FieldByName('name').asString;
  //    Sheet.Cells[index,6]:=OraQuery1.FieldByName('kod').asString;
      FExcel.Range['A'+IntTostr(index)+':A'+IntTostr(index)].Select;
      FExcel.Selection.BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);
      FExcel.Range['B'+IntTostr(index)+':B'+IntTostr(index)].Select;
      FExcel.Selection.BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);
      FExcel.Range['C'+IntTostr(index)+':C'+IntTostr(index)].Select;
      FExcel.Selection.BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);
      FExcel.Range['D'+IntTostr(index)+':D'+IntTostr(index)].Select;
      FExcel.Selection.BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);
            FExcel.Range['E'+IntTostr(index)+':E'+IntTostr(index)].Select;
      FExcel.Selection.BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);
            FExcel.Range['F'+IntTostr(index)+':F'+IntTostr(index)].Select;
      FExcel.Selection.BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);


  // tx1:=' Select PATH from (';
//   tx1:=tx1+' SELECT SYS_CONNECT_BY_PATH(NPOZ||'' ''|| (Select kod from tronix.sprav where sprav_id=sprav_sprav_id_sostav)||'' ''||tronix_sp_name(sprav_sprav_id_sostav)||'' ''||kol,'':'') AS PATH,';
//   tx1:=tx1+' sprav_sprav_id,NPOZ';
//   tx1:=tx1+' from TRONIX_SOSTAV';
//   tx1:=tx1+' START WITH sprav_sprav_id='+OraQuery1.FieldByName('sprav_sprav_id').asString;
//   tx1:=tx1+' connect by prior sprav_sprav_id_sostav=sprav_sprav_id) ';
//   tx1:=tx1+' where sprav_sprav_id='+OraQuery1.FieldByName('sprav_sprav_id').asString;
//   tx1:=tx1+' order by NPOZ';

   tx1:=' Select PATH from (';
   tx1:=tx1+'Select ''-''||NPOZ||'' ''||(Select kod from tronix.sprav where sprav_id=sprav_sprav_id_sostav)||'' ''||';
   tx1:=tx1+' tronix_sp_name(sprav_sprav_id_sostav) PATH ';
   tx1:=tx1+'from TRONIX_SOSTAV where sprav_sprav_id='+OraQuery1.FieldByName('sprav_sprav_id').asString;
   tx1:=tx1+'order by NPOZ) ';


    OraQuery2.SQL.Text:=tx1;
    OraQuery2.ExecSQL;
     OraQuery2.First;
      stroka:='';
     While not OraQuery2.Eof do
      begin
    stroka:=stroka+chr(10)+OraQuery2.FieldByName('PATH').asString+';';
    OraQuery2.Next;
     end;
         Sheet.Cells[index,6]:=stroka;
      OraQuery1.Next;
      inc(index);
     end;
   //  FExcel.Range['A5:F'+IntTostr(index-1)].Select;
          if index>5 then
          begin
      FExcel.Range['A5:F'+IntTostr(index-1)].Select;
     FExcel.Selection.VerticalAlignment:=xlCenter;
     FExcel.Selection.WrapText:=True;
    FExcel.Selection.EntireRow.AutoFit;
     FExcel.Visible:=true;
     end;

    end;

end;

procedure TForm2.FormShow(Sender: TObject);
begin
   Combobox1.Items.Add('По всем');
  // up_level:=Edit3.Text;
   if Caption<>'Ведомость по комплектации сводная!' then   ProgressBar1.Visible:=false;
   if Caption='МСЧ (Россыпь) с составом по проекту' then Combobox1.Visible:=false;
end;

procedure TForm2.ComboBox1Select(Sender: TObject);
begin

Form3.OraQuery2.First;
 While Not Form3.OraQuery2.Eof do
     begin
 if  Form3.OraQuery2.FieldByName('Nomer').AsString=Combobox1.Text
  then Edit3.Text:= Form3.OraQuery2.FieldByName('tex_id').AsString;
 if  Combobox1.Text='По всем'
    then Edit3.Text:=up_level;
     Form3.OraQuery2.Next;
      end;


end;

procedure TForm2.Button3Click(Sender: TObject);
begin
   Form5.Caption:='Ведомость по комплектации сводная по '+Edit1.Text+' '+Edit2.Text;
 //Form5.Uzak:=
 Form5.Show;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin

      Form2.Close;

end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Form3.OraQuery2.Close;
     Form3.OraQuery1.Close;
      Form3.OraQuery3.Close;
     edit1.Text:='';
     edit2.Text:='';
     edit3.Text:='';
     Form2.ProgressBar1.Position:=0;
     Form2.Label3.Caption:='';
      Combobox1.Clear;
      OraQuery1.Close;
      CAption:='Ведомость по комплектации сводная!' ;
      ProgressBar1.Visible:=true;
      OraQuery1.Close;
      OraQuery2.Close;
end;

end.
