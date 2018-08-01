unit Unit40;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, MemTableDataEh, GridsEh, DBGridEh,
  MemTableEh, DataDriverEh, StdCtrls;

type
  TForm40 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery2: TOraQuery;
    OraDataSource2: TOraDataSource;
    DataSetDriverEh1: TDataSetDriverEh;
    MemTableEh1: TMemTableEh;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form40: TForm40;

implementation

uses Unit36;

{$R *.dfm}

procedure TForm40.FormShow(Sender: TObject);
var text: array[1..100] of string;
I, delta:integer;
strin:string;
begin
text[1]:=Form36.DBGridEh1.DataSource.DataSet.FieldByName('texkompl_id').AsString ;
I:=1;
delta:=0;
While delta<I do
 begin
with OraQuery1   do
     begin
 inc(delta);
//SQL.Text:='Select tk2 from (  ';
//  SQL.Text:=SQL.Text+' Select  Decode((SUBSTR(kaka,1,1)),''0'',SUBSTR(kaka,4,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+1,7))) tk1, ';
//  SQL.Text:=SQL.Text+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,12,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+9,7))) tk2, ';
//  SQL.Text:=SQL.Text+' SUBSTR(kaka,1,1) ddd ';
//  SQL.Text:=SQL.Text+'  from ';
//  SQL.Text:=SQL.Text+' ( ';
//  SQL.Text:=SQL.Text+' Select  nordsy.load_marsh(nn) kaka from ';
//  SQL.Text:=SQL.Text+' (Select nn from ';
//  SQL.Text:=SQL.Text+' (Select nn,kol   from  tronix.sp ';
//  SQL.Text:=SQL.Text+' connect by prior nn=up_nn ';
//  SQL.Text:=SQL.Text+' start with nn in (Select  sp_sp_id from nordsy.tx_mat ';
//  SQL.Text:=SQL.Text+' where tex_texkompl_id ='+text[delta]+')) ';
//  SQL.Text:=SQL.Text+' ) ';
//  SQL.Text:=SQL.Text+' ) ';
//  SQL.Text:=SQL.Text+' group by kaka ';
//  SQL.Text:=SQL.Text+' ) ';
//  SQL.Text:=SQL.Text+' where (tk1 is not null) and (tk1 =' +text[delta]+') and  (tk2 is not null) ';
//  SQL.Text:=SQL.Text+' and  (ddd=0) ';


 SQL.Text:=' Select tk2 from ( ';
 SQL.Text:=SQL.Text+' Select tk2 from(  ';
 SQL.Text:=SQL.Text+' Select  tk1 ';
 SQL.Text:=SQL.Text+'  ,tk2,tk3,tk4,ddd from ( ';
 SQL.Text:=SQL.Text+' Select  Decode((SUBSTR(kaka,1,1)),''0'',SUBSTR(kaka,4,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+1,7))) tk1, ';
 SQL.Text:=SQL.Text+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,12,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+9,7))) tk2, ';
 SQL.Text:=SQL.Text+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,20,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+17,7))) tk3, ';
 SQL.Text:=SQL.Text+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,28,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+25,7))) tk4, ';
 SQL.Text:=SQL.Text+' SUBSTR(kaka,1,1) ddd ';
 SQL.Text:=SQL.Text+'  from ';
 SQL.Text:=SQL.Text+' ( ';
 SQL.Text:=SQL.Text+' Select  nordsy.load_marsh(nn) kaka from ';
 SQL.Text:=SQL.Text+' (Select nn from ';
 SQL.Text:=SQL.Text+' (Select nn,kol   from  tronix.sp ';
 SQL.Text:=SQL.Text+' connect by prior nn=up_nn ';
 SQL.Text:=SQL.Text+' start with nn in (Select  sp_sp_id from nordsy.tx_mat ';
 SQL.Text:=SQL.Text+' where tex_texkompl_id ='+text[delta]+')) ';
 SQL.Text:=SQL.Text+' ) ';
 SQL.Text:=SQL.Text+' ) ';
 SQL.Text:=SQL.Text+' group by kaka ';
 SQL.Text:=SQL.Text+' ) ';
 SQL.Text:=SQL.Text+' where ddd=0  and ((tk1 is not null) and (tk1='+text[delta]+')) or ((tk2 is not null) and (tk2='+text[delta]+')) or ((tk3 is not null) and (tk3='+text[delta]+')) or ((tk4 is not null) and (tk4='+text[delta]+')) ';
 SQL.Text:=SQL.Text+' and ((ddd=3) or (ddd=0)) ';
 SQL.Text:=SQL.Text+' ) where tk1='+text[delta]+' and tk2 is not null ';
 SQL.Text:=SQL.Text+' union all ';
 SQL.Text:=SQL.Text+' Select tk3 from( ';
 SQL.Text:=SQL.Text+' Select  tk1 ';
 SQL.Text:=SQL.Text+'  ,tk2,tk3,tk4,ddd from ( ';
 SQL.Text:=SQL.Text+' Select  Decode((SUBSTR(kaka,1,1)),''0'',SUBSTR(kaka,4,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+1,7))) tk1, ';
 SQL.Text:=SQL.Text+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,12,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+9,7))) tk2, ';
 SQL.Text:=SQL.Text+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,20,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+17,7))) tk3, ';
 SQL.Text:=SQL.Text+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,28,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+25,7))) tk4, ';
 SQL.Text:=SQL.Text+' SUBSTR(kaka,1,1) ddd  ';
 SQL.Text:=SQL.Text+'  from ';
 SQL.Text:=SQL.Text+' ( ';
 SQL.Text:=SQL.Text+' Select  nordsy.load_marsh(nn) kaka from ';
 SQL.Text:=SQL.Text+' (Select nn from ';
 SQL.Text:=SQL.Text+' (Select nn,kol   from  tronix.sp ';
 SQL.Text:=SQL.Text+' connect by prior nn=up_nn ';
 SQL.Text:=SQL.Text+' start with nn in (Select  sp_sp_id from nordsy.tx_mat ';
 SQL.Text:=SQL.Text+' where tex_texkompl_id ='+text[delta]+')) ';
 SQL.Text:=SQL.Text+' ) ';
 SQL.Text:=SQL.Text+' ) ';
 SQL.Text:=SQL.Text+' group by kaka ';
 SQL.Text:=SQL.Text+' ) ';
 SQL.Text:=SQL.Text+' where ddd=0  and ((tk1 is not null) and (tk1='+text[delta]+')) or ((tk2 is not null) and (tk2='+text[delta]+')) or ((tk3 is not null) and (tk3='+text[delta]+')) or ((tk4 is not null) and (tk4='+text[delta]+')) ';
 SQL.Text:=SQL.Text+' and ((ddd=3) or (ddd=0)) ';
 SQL.Text:=SQL.Text+' ) where tk2='+text[delta]+' and tk3 is not null ';
 SQL.Text:=SQL.Text+' union all ';
 SQL.Text:=SQL.Text+' Select tk4 from( ';
 SQL.Text:=SQL.Text+' Select  tk1 ';
 SQL.Text:=SQL.Text+'  ,tk2,tk3,tk4,ddd from ( ';
 SQL.Text:=SQL.Text+' Select  Decode((SUBSTR(kaka,1,1)),''0'',SUBSTR(kaka,4,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+1,7))) tk1, ';
 SQL.Text:=SQL.Text+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,12,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+9,7))) tk2, ';
 SQL.Text:=SQL.Text+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,20,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+17,7))) tk3, ';
 SQL.Text:=SQL.Text+'  Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,28,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+25,7))) tk4, ';
 SQL.Text:=SQL.Text+' SUBSTR(kaka,1,1) ddd ';
 SQL.Text:=SQL.Text+'  from ';
 SQL.Text:=SQL.Text+' ( ';
 SQL.Text:=SQL.Text+' Select  nordsy.load_marsh(nn) kaka from ';
 SQL.Text:=SQL.Text+' (Select nn from ';
 SQL.Text:=SQL.Text+' (Select nn,kol   from  tronix.sp ';
 SQL.Text:=SQL.Text+' connect by prior nn=up_nn ';
 SQL.Text:=SQL.Text+' start with nn in (Select  sp_sp_id from nordsy.tx_mat ';
 SQL.Text:=SQL.Text+' where tex_texkompl_id ='+text[delta]+')) ';
 SQL.Text:=SQL.Text+' ) ';
 SQL.Text:=SQL.Text+' ) ';
 SQL.Text:=SQL.Text+' group by kaka ';
 SQL.Text:=SQL.Text+' ) ';
 SQL.Text:=SQL.Text+' where ddd=0  and ((tk1 is not null) and (tk1='+text[delta]+')) or ((tk2 is not null) and (tk2='+text[delta]+')) or ((tk3 is not null) and (tk3='+text[delta]+')) or ((tk4 is not null) and (tk4='+text[delta]+')) ';
 SQL.Text:=SQL.Text+' and ((ddd=3) or (ddd=0)) ';
 SQL.Text:=SQL.Text+' ) where tk3='+text[delta]+' and tk4 is not null ';
 SQL.Text:=SQL.Text+' ) ';
 SQL.Text:=SQL.Text+' group by tk2 ';

  ExecSQL;
 // ShowMessage(intTostr(OraQuery1.RecordCount)+' '+IntTostr(i)+' '+IntTostr(delta));
  if OraQuery1.RecordCount>0 then
   begin
  First;
  while OraQuery1.Eof<>true do
  Begin
     inc(i);
     text[I]:=OraQuery1.FieldByName('tk2').asString;
  //  ShowMessage(OraQuery1.FieldByName('tk2').asString+' '+IntTostr(i)+' '+IntTostr(delta));
    OraQuery1.Next;
 end;
 end;
   end;
  end;

  if i<>1 then
      begin
      strin:=text[1]+',';
       while i<>0 do
         begin
          strin:= strin+text[i]+',';
          dec(i);
        end;
       strin:=(copy(strin,1,Length(strin)-1));
      end;
 // ShowMessage(strin);
 ///********************* теперь разварачиваем!!!!!!!!!!!!

with OraQuery2   do
     begin
//SQL.Text:=' Select tk1,tk2,ddd,  (Select nomer from tx_texkompl where texkompl_id=tk2) nom1  from (   ';
//SQL.Text:=SQL.Text+' Select  Decode((SUBSTR(kaka,1,1)),''0'',SUBSTR(kaka,4,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+1,7))) tk1,';
//SQL.Text:=SQL.Text+' Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,12,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+9,7))) tk2,';
//SQL.Text:=SQL.Text+' SUBSTR(kaka,1,1) ddd';
//SQL.Text:=SQL.Text+'  from ';
//SQL.Text:=SQL.Text+' ( ';
//SQL.Text:=SQL.Text+' Select  nordsy.load_marsh(nn) kaka from ';
//SQL.Text:=SQL.Text+' (Select nn from ';
//SQL.Text:=SQL.Text+' (Select nn,kol   from  tronix.sp ';
//SQL.Text:=SQL.Text+' connect by prior nn=up_nn ';
//SQL.Text:=SQL.Text+' start with nn in (Select  sp_sp_id from nordsy.tx_mat ';
//SQL.Text:=SQL.Text+' where tex_texkompl_id in ('+strin+'))) ';
//SQL.Text:=SQL.Text+' ) ';
//SQL.Text:=SQL.Text+' ) ';
//SQL.Text:=SQL.Text+' group by kaka ';
//SQL.Text:=SQL.Text+' ) ';
//SQL.Text:=SQL.Text+' where (tk1 is not null) and tk1 in ('+strin+') and  (tk2 is not null) ';
//SQL.Text:=SQL.Text+' and  (ddd=0) ';
//SQL.Text:=SQL.Text+' union all ';
//SQL.Text:=SQL.Text+' Select '''' tk1,to_char(texkompl_id) tk2, ''0'' ddd, nomer nom1 from tx_texkompl where texkompl_id='+text[1];

SQL.Text:= ' Select tk1,tk2, (Select nomer from tx_texkompl where texkompl_id=tk2) nom1,(Select name from tx_texkompl where texkompl_id=tk2) name  from ( ';
SQL.Text:=SQL.Text+' Select '''' tk1,to_char(texkompl_id) tk2, ''0'' ddd from tx_texkompl where texkompl_id='+text[1];
SQL.Text:=SQL.Text+' union all' ;

SQL.Text:=SQL.Text+' Select tk1,tk2,ddd from (   ';
SQL.Text:=SQL.Text+' Select  Decode((SUBSTR(kaka,1,1)),''0'',SUBSTR(kaka,4,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+1,7))) tk1,';
SQL.Text:=SQL.Text+' Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,12,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+9,7))) tk2,';
SQL.Text:=SQL.Text+' SUBSTR(kaka,1,1) ddd';
SQL.Text:=SQL.Text+'  from ';
SQL.Text:=SQL.Text+' ( ';
SQL.Text:=SQL.Text+' Select  nordsy.load_marsh(nn) kaka from ';
SQL.Text:=SQL.Text+' (Select nn from ';
SQL.Text:=SQL.Text+' (Select nn,kol   from  tronix.sp ';
SQL.Text:=SQL.Text+' connect by prior nn=up_nn ';
SQL.Text:=SQL.Text+' start with nn in (Select  sp_sp_id from nordsy.tx_mat ';
SQL.Text:=SQL.Text+' where tex_texkompl_id in ('+strin+'))) ';
SQL.Text:=SQL.Text+' ) ';
SQL.Text:=SQL.Text+' ) ';
SQL.Text:=SQL.Text+' group by kaka ';
SQL.Text:=SQL.Text+' ) ';
SQL.Text:=SQL.Text+' where (tk1 is not null) and tk1 in ('+strin+') and  (tk2 is not null) ';
SQL.Text:=SQL.Text+' and  (ddd=0) ';
SQL.Text:=SQL.Text+' union all' ;

SQL.Text:=SQL.Text+' Select tk1,tk2,ddd    from (   ';
SQL.Text:=SQL.Text+' Select Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,12,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+9,7))) tk1,     ';
SQL.Text:=SQL.Text+' Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,20,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+17,7))) tk2,     ';
SQL.Text:=SQL.Text+' SUBSTR(kaka,1,1) ddd';
SQL.Text:=SQL.Text+'  from ';
SQL.Text:=SQL.Text+' ( ';
SQL.Text:=SQL.Text+' Select  nordsy.load_marsh(nn) kaka from ';
SQL.Text:=SQL.Text+' (Select nn from ';
SQL.Text:=SQL.Text+' (Select nn,kol   from  tronix.sp ';
SQL.Text:=SQL.Text+' connect by prior nn=up_nn ';
SQL.Text:=SQL.Text+' start with nn in (Select  sp_sp_id from nordsy.tx_mat ';
SQL.Text:=SQL.Text+' where tex_texkompl_id in ('+strin+'))) ';
SQL.Text:=SQL.Text+' ) ';
SQL.Text:=SQL.Text+' ) ';
SQL.Text:=SQL.Text+' group by kaka ';
SQL.Text:=SQL.Text+' ) ';
SQL.Text:=SQL.Text+' where (tk1 is not null) and tk1 in ('+strin+') and  (tk2 is not null) ';
SQL.Text:=SQL.Text+' and  (ddd=0) ';
SQL.Text:=SQL.Text+' union all'  ;

SQL.Text:=SQL.Text+' Select tk1,tk2,ddd from (   ';
SQL.Text:=SQL.Text+' Select Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,20,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+17,7))) tk1, ';
SQL.Text:=SQL.Text+' Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,28,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+25,7))) tk2,  ';
SQL.Text:=SQL.Text+' SUBSTR(kaka,1,1) ddd';
SQL.Text:=SQL.Text+'  from ';
SQL.Text:=SQL.Text+' ( ';
SQL.Text:=SQL.Text+' Select  nordsy.load_marsh(nn) kaka from ';
SQL.Text:=SQL.Text+' (Select nn from ';
SQL.Text:=SQL.Text+' (Select nn,kol   from  tronix.sp ';
SQL.Text:=SQL.Text+' connect by prior nn=up_nn ';
SQL.Text:=SQL.Text+' start with nn in (Select  sp_sp_id from nordsy.tx_mat ';
SQL.Text:=SQL.Text+' where tex_texkompl_id in ('+strin+'))) ';
SQL.Text:=SQL.Text+' ) ';
SQL.Text:=SQL.Text+' ) ';
SQL.Text:=SQL.Text+' group by kaka ';
SQL.Text:=SQL.Text+' ) ';
SQL.Text:=SQL.Text+' where (tk1 is not null) and tk1 in ('+strin+') and  (tk2 is not null) ';
SQL.Text:=SQL.Text+' and  (ddd=0)) ';


  ExecSQL;
  MemTableEh1.TreeList.Active := True;
  MemTableEh1.Open;
  end;
end;

procedure TForm40.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close();
  OraQuery2.Close();
     MemTableEh1.Close;
end;

end.
