unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, StdCtrls;

type
  TForm4 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Button1: TButton;
    OraQuery2: TOraQuery;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var tx:string;
fin : boolean;
d,i,j,z,counter:integer;
begin
fin:=false;
tx:='5662832';
d:=0;
StringGrid1.ColCount:=StringGrid1.ColCount+1;
 while not fin=true do
 begin


    if StringGrid1.ColCount>2 then
       begin
         tx:=StringGrid1.Cells[StringGrid1.ColCount-4,d];
         ShowMessage(tx);
        end;
     oraQuery2.SQL.Text:='Select TEXKOMPL_ID,TEXKOMPL_TEXKOMPL_ID, NOMER,NAME  from nordsy.texkompl';
     oraQuery2.SQL.ADD('where TEXKOMPL_TEXKOMPL_ID='+tx);

    oraQuery2.ExecSQL;   ShowMessage('z!!   '+IntToStr(z)+' rec!!!   '+IntToStr(OraQuery2.RecordCount));
      While not oraQuery2.Eof do
        begin
        ShowMessage(IntTostr(StringGrid1.RowCount)+'   d'+IntToStr(d));
       //    if (StringGrid1.RowCount-1<>d) then
       //      begin
               ShowMessage('Nado!!!');



//Сдвигаем содержимое таблицы вниз
                ShowMessage(IntToStr(d));
              for z:=0 to OraQuery2.RecordCount do
                begin
                   ShowMessage('z   '+IntToStr(z)+' rec   '+IntToStr(OraQuery2.RecordCount));
                  StringGrid1.RowCount:=StringGrid1.RowCount+1;
                for i:= 0 to StringGrid1.RowCount-2-d do // Переносим на одну строчку меньше

                  for j:=0 to StringGrid1.ColCount-1 do
                    //       ShowMessage(IntToStr(StringGrid1.RowCount-i-1));
                   StringGrid1.Cells[j,StringGrid1.RowCount-i-1]:=StringGrid1.Cells[j,StringGrid1.RowCount-i-2];
        //           for j:=0 to StringGrid1.ColCount-1 do
        //             StringGrid1.Cells[j,1]:='';//очищаем от содержимого первую (после фиксированной) строку
                   // StringGrid1.RowMoved(1, 2);
                   // z:=z+1;
                  // Next;
                end;

                   d:=d+1;
                //   if (d+1)< StringGrid1.RowCount then
                 counter:=Counter+1;

         //    end ;
      //     else
            //    StringGrid1.RowCount:=StringGrid1.RowCount+1;

              ShowMessage(IntToStr(d)+'!!!!!!!!!!!!!!!!!!!!!!');
            StringGrid1.Cells[StringGrid1.ColCount-2,d] :=oraQuery2.FieldByName('TEXKOMPL_ID').AsString;
            StringGrid1.Cells[StringGrid1.ColCount-1,d] :=oraQuery2.FieldByName('NAme').AsString;
           // d:=d+1;
           ShowMessage(IntToStr(d)+'!');

  //          oraQuery1.SQL.Text:='Select tex_texkompl_id, Sprav_sprav_id from nordsy.tx_mat where tex_texkompl_id='#39+oraQuery2.FieldByName('TEXKOMPL_ID').AsString+#39;
  //          oraQuery1.ExecSQL;
  //         While not oraQuery1.Eof do
  //         begin
 //              StringGrid1.RowCount:=StringGrid1.RowCount+1;
  //             StringGrid1.Cells[StringGrid1.ColCount-2,d] :=oraQuery2.FieldByName('TEXKOMPL_ID').AsString;
 //              StringGrid1.Cells[StringGrid1.ColCount-1,d] :=oraQuery2.FieldByName('NAme').AsString;
              // StringGrid1.Cells[StringGrid1.ColCount,d] :=oraQuery2.FieldByName('NAme').AsString;
 //              oraQuery1.Next;
 //          end;

   //   if Counter=0 then
  // d:=d+1;

         oraQuery2.Next;

         if   StringGrid1.ColCount>2 then
           begin
        d:=d+counter;
        counter:=0;

     end;

        end;
 //   oraQuery1.Next;
    // end;
  //  tx:='';


    ShowMessage('Cou ' +IntToStr(Counter)+' '+IntToStr(d)+' '+IntToStr(StringGrid1.RowCount));counter:=0;
   if d+1=StringGrid1.RowCount then
     begin
       StringGrid1.ColCount:=StringGrid1.ColCount+2;
       d:=1;
     end;

  end;
    if tx='' then fin:=true;




end;

end.
