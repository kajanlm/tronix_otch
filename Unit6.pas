unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls,ComObj,
  OleServer, ExcelXP, GridsEh;


type
  TForm6 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery2: TOraQuery;
    StringGrid1: TStringGrid;
    OraQuery3: TOraQuery;
    Button1: TButton;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelApplication1: TExcelApplication;
    OraQuery4: TOraQuery;
    DBGridEh1: TDBGridEh;
    OraQuery5: TOraQuery;
    OraQuery6: TOraQuery;
    OraQuery7: TOraQuery;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelOLEObject1: TExcelOLEObject;
    OraQuery8: TOraQuery;
    OraQuery9: TOraQuery;
    OraQuery10: TOraQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  z:integer;
  nom:String;

   function Get_Sostav(id:String):integer;
   function Get_POD_Sostav(id,SPRAv:string):integer;
   function Get_MARSHRUT(id,SPRAv,type_relation:string):integer;
   function Get_MARSHRUT_full(id,SPRAv:string):integer;
   function Get_MARSHRUT_up(id,SPRAv,type_relation:string):integer;
   function Get_MARSHRUT_full_up(id,SPRAv:string):integer;
   function Get_Doc(id,SPRAv:string):integer;
implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm6.FormShow(Sender: TObject);
var tx,tx1,id:string;
d:integer;
begin
 StringGrid1.ColWidths[3]:=400;  StringGrid1.ColWidths[6]:=50; StringGrid1.ColWidths[7]:=50;StringGrid1.ColWidths[0]:=10;
 StringGrid1.ColWidths[9]:=200;StringGrid1.ColWidths[4]:=200;StringGrid1.ColWidths[5]:=200;StringGrid1.ColWidths[8]:=200;
 StringGrid1.ColWidths[0]:=50;StringGrid1.ColWidths[10]:=100;
 id:=Form2.Edit3.Text;
  z:=1;
   with    Form2.Combobox1 do
 Nom:=Items[ItemIndex];


   OraQuery8.SQL.Text:='Select NT.Texkompl_id  tex_id,nt1.Texkompl_id, NT.project_project_id, NT.texkompl_texkompl_id, NT.nomer, NT.name,NT.uch_uch_id,nt1.project_project_id from Nordsy.Texkompl nt1';
   OraQuery8.SQL.Add(' Right Join Nordsy.Texkompl NT2 on NT1.Texkompl_id=NT2.texkompl_texkompl_id ');
   OraQuery8.SQL.Add(' Right Join Nordsy.Texkompl NT on NT2.Texkompl_id=NT.texkompl_texkompl_id ');
   OraQuery8.SQL.Add('where NT1.project_project_id='+#39+Form3.OraQuery1.FieldByName('project_id').asstring+#39+' and NT1.uzak_uzak_id='+#39+Form3.OraQuery3.FieldByName('ID_RABOT').asstring+#39);


  if (NOM<>'По всем')then
   begin
       OraQuery8.SQL.Add(' and  NT.Texkompl_id='+#39+id+#39);
   end;
    OraQuery8.SQL.Add('order by NT.NOMER');
   OraQuery8.ExecSQL;



    OraQuery8.First;
       While Not OraQuery8.Eof do
       begin

       id:= OraQuery8.FieldByName('tex_id').asstring;
       Nom:=OraQuery8.FieldByName('nomer').AsString;
       Form2.ProgressBar1.Position:=ROUND(OraQuery8.RecNo*100/OraQuery8.RecordCount);
       Form2.Label3.Caption:= nom+' '+IntToStr(OraQuery8.RecNo)+' из '+IntToStr(OraQuery8.RecordCount)+' '+IntToStr(ROUND(OraQuery8.RecNo*100/OraQuery8.RecordCount))+'%';
       Application.ProcessMessages;




tx:='Select nto.TEXKOMPL_ID,nto.TEXKOMPL_TEXKOMPL_ID,  ';
tx:=tx+' nt1.TEXKOMPL_ID,nt1.TEXKOMPL_TEXKOMPL_ID,  ';
tx:=tx+' NTM.TEX_TEXKOMPL_ID ,ntm.Sprav_sprav_ID,  ';
tx:=tx+' NTM1.TEX_TEXKOMPL_ID ,ntm1.Sprav_sprav_ID,  ';
tx:=tx+' SPRAV1.SPRAV_id ,Sprav1.NAME, SPRAV1.kod, ';
tx:=tx+' ttn_mat1.texkompl_texkompl_id_from ,ttn_mat1.Sprav_sprav_id, ttn_mat1.ttn_ttn_id, ';
tx:=tx+' t.nomer, t.type_ttn_type_ttn_id, t.date_dok,t.user_date1,';
tx:=tx+' typ.Name, ';
tx:=tx+' orc.texcompl_befo ,orc.Texcompl_afto, ';
tx:=tx+' orc1.texcompl_befo ,orc1.Texcompl_afto, ';
tx:=tx+' orc2.texcompl_befo ,orc2.Texcompl_afto, ';
tx:=tx+' orc3.texcompl_befo ,orc3.Texcompl_afto, ';
tx:=tx+' orc4.texcompl_befo ,orc4.Texcompl_afto ';

tx:=tx+'  from nordsy.texkompl nto ';

tx:=tx+'Right Join nordsy.texkompl nt on (nto.TEXKOMPL_ID=nt.TEXKOMPL_TEXKOMPL_ID) LEFT Join Nordsy.tx_mat NTM on nt.TEXKOMPL_ID= NTM.TEX_TEXKOMPL_ID ';
tx:=tx+'Right Join nordsy.texkompl nt1 on (nt.TEXKOMPL_ID=nt1.TEXKOMPL_TEXKOMPL_ID) LEFT Join Nordsy.tx_mat NTM1 on nt1.TEXKOMPL_ID= NTM1.TEX_TEXKOMPL_ID ';
tx:=tx+'LEFT JOIN TRONIX.SPRAV SPRAV1 on ntm1.Sprav_sprav_ID=SPRAV1.SPRAV_id ';
tx:=tx+' JOIN tronix.ttn_mat ttn_mat1 on (ttn_mat1.texkompl_texkompl_id_from=nto.TEXKOMPL_ID) and (ttn_mat1.Sprav_sprav_id=SPRAV1.SPRAV_id)';
tx:=tx+' Join tronix.ttn  t on t.ttn_id=ttn_mat1.ttn_ttn_id ';
tx:=tx+' Join tronix.type_ttn typ on typ.type_ttn_id= t.type_ttn_type_ttn_id ';

tx:=tx+'LEFT JOIN Nordsy.tex_or_c orc on orc.texcompl_befo=nt1.texkompl_id ';
tx:=tx+'LEFT JOIN Nordsy.tex_or_c orc1 on orc1.texcompl_befo=orc.Texcompl_afto ' ;
tx:=tx+'LEFT JOIN Nordsy.tex_or_c orc2 on orc2.texcompl_befo=orc1.Texcompl_afto ' ;
tx:=tx+'LEFT JOIN Nordsy.tex_or_c orc3 on orc3.texcompl_befo=orc2.Texcompl_afto ' ;
tx:=tx+'LEFT JOIN Nordsy.tex_or_c orc4 on orc4.texcompl_befo=orc3.Texcompl_afto ' ;
tx:=tx+ ' where nto.TEXKOMPL_TEXKOMPL_ID='+#39+id+#39;

 oraQuery7.SQL.Text:=tx;

oraQuery7.ExecSQL;



///******************************


tx:='Select nto.TEXKOMPL_ID,nto.TEXKOMPL_TEXKOMPL_ID, nt.TEXKOMPL_ID,nt.TEXKOMPL_TEXKOMPL_ID, ';
tx:=tx+' nt1.TEXKOMPL_ID,nt1.TEXKOMPL_TEXKOMPL_ID, nt1.NOMER,nt1.NAME, ';
tx:=tx+' NTM1.TEX_TEXKOMPL_ID ,ntm1.Sprav_sprav_ID, ntm1.kol,ntm1.koded_koded_id, ntm1.type_relation_type_relation_id, ';
tx:=tx+' SPRAV1.SPRAV_id ,Sprav1.NAME, SPRAV1.kod, ';
tx:=tx+' koded.NAMEK, Sprav1.oboznold ';
tx:=tx+'  from nordsy.texkompl nto ';
tx:=tx+'Right Join nordsy.texkompl nt on (nto.TEXKOMPL_ID=nt.TEXKOMPL_TEXKOMPL_ID) LEFT Join Nordsy.tx_mat NTM on nt.TEXKOMPL_ID= NTM.TEX_TEXKOMPL_ID ';
tx:=tx+'Right Join nordsy.texkompl nt1 on (nt.TEXKOMPL_ID=nt1.TEXKOMPL_TEXKOMPL_ID) LEFT Join Nordsy.tx_mat NTM1 on nt1.TEXKOMPL_ID= NTM1.TEX_TEXKOMPL_ID LEFT JOIN TRONIX.SPRAV SPRAV1 on ntm1.Sprav_sprav_ID=SPRAV1.SPRAV_id ';
//*tx:=tx+' LEFT join tronix.RAZ_LOV tyl on  SPRAV1.TYP_LOV_TYP_LOV_ID=tyl.RAZ_LOV_ID ';
tx:=tx+'LEFT JOIN TRONIX.koded koded on ntm1.koded_koded_ID=koded.koded_id ';
tx:=tx+ ' where ((nto.TEXKOMPL_TEXKOMPL_ID='+#39+id+#39+') and (not exists (select orc5.texcompl_befo,orc5.Texcompl_afto from  Nordsy.tex_or_c orc5 where orc5.texcompl_befo=nt1.texkompl_id))';// or ';
tx:=tx+ ' and ((ntm1.type_relation_type_relation_id=10)  or (ntm1.type_relation_type_relation_id=7)))';//* or (ntm1.type_relation_type_relation_id is NULL)))';

  oraQuery1.SQL.Text:=tx;

     oraQuery1.ExecSQL; //*ShowMessage('Pfgbc  '+IntToStr(oraQuery1.RecordCount));
        d:=1;
     While NOT oraQuery1.EOF do
     begin

          StringGrid1.RowCount:=StringGrid1.RowCount+1;
           StringGrid1.Cells[3,StringGrid1.RowCount-2]:=oraQuery1.FieldByName('NAME_1').AsString;
           StringGrid1.Cells[4,StringGrid1.RowCount-2]:=oraQuery1.FieldByName('KOD').AsString;
      oraQuery10.SQL.Text:='Select tl.name from tronix.typ_lov tl,tronix.sprav sp where sp.typ_lov_typ_lov_id=tl.typ_lov_id and sp.kod='+#39+oraQuery1.FieldByName('KOD').AsString+#39;

      oraQuery10.ExecSQL;

         StringGrid1.Cells[5,StringGrid1.RowCount-2]:=oraQuery1.FieldByName('oboznold').AsString+'  '+oraQuery10.FieldByName('name').AsString;

           StringGrid1.Cells[6, StringGrid1.RowCount-2]:=oraQuery1.FieldByName('KOL').AsString;
            StringGrid1.Cells[7, StringGrid1.RowCount-2]:=oraQuery1.FieldByName('NAMEK').AsString;
            StringGrid1.Cells[1, StringGrid1.RowCount-2]:=NOM;
           StringGrid1.Cells[2, StringGrid1.RowCount-2]:='**'; z:=0;
            StringGrid1.Cells[8,StringGrid1.RowCount-2]:='  Склад';
            Get_Doc(oraQuery1.FieldByName('Tex_Texkompl_id').AsString,oraQuery1.FieldByName('SPRAV_id').AsString);
           Get_MARSHRUT(oraQuery1.FieldByName('Tex_Texkompl_id').AsString,oraQuery1.FieldByName('SPRAV_id').AsString,
           oraQuery1.FieldByName('type_relation_type_relation_id').AsString);
            Get_Sostav(oraQuery1.FieldByName('Tex_Texkompl_id').AsString);    //*Texkompl_id_2'



        oraQuery1.Next;
     end;

        OraQuery8.Next;




      end;


  end;


  function Get_Sostav(id:string):integer;
   var tx:String;

    begin

    tx:='Select  ';
    tx:=tx+' NTM.TEX_TEXKOMPL_ID ,ntm.Sprav_sprav_ID, ntm.kol, ntm.type_relation_type_relation_id, ';
    tx:=tx+' SPRAV1.SPRAV_id ,Sprav1.NAME, SPRAV1.kod, ';
    tx:=tx+' koded.NAMEK, Sprav1.oboznold  ';
    tx:=tx+'  from Nordsy.tx_mat NTM ';
    tx:=tx+' JOIN TRONIX.SPRAV SPRAV1 on ntm.Sprav_sprav_ID=SPRAV1.SPRAV_id ';
    //tx:=tx+' LEFT join tronix.typ_lov tyl on  SPRAV1.TYP_LOV_TYP_LOV_ID=tyl.TYP_LOV_ID ';
    tx:=tx+'LEFT JOIN TRONIX.koded koded on ntm.koded_koded_ID=koded.koded_id ';
    tx:=tx+ ' where (NTM.TEX_TEXKOMPL_ID='+#39+id+#39+') ';// or ';
    tx:=tx+ ' and ((ntm.type_relation_type_relation_id=8) or (ntm.type_relation_type_relation_id=7) or (ntm.type_relation_type_relation_id is NULL))';


   Form6.oraQuery2.SQL.Text:=tx;
   Form6.oraQuery2.ExecSQL;
   With Form6 Do
             Begin
                While NOT oraQuery2.EOF do
                         begin
                         if (oraQuery2.FieldByName('NAME').AsString='8') or (oraQuery2.FieldByName('NAME').AsString='') then begin
                          StringGrid1.RowCount:=StringGrid1.RowCount+1;
                          StringGrid1.Cells[3,StringGrid1.RowCount-2]:=oraQuery2.FieldByName('NAME').AsString;
                           StringGrid1.Cells[4,StringGrid1.RowCount-2]:=oraQuery2.FieldByName('KOD').AsString;
                                 oraQuery10.SQL.Text:='Select tl.name from tronix.typ_lov tl,tronix.sprav sp where sp.typ_lov_typ_lov_id=tl.typ_lov_id and sp.kod='+#39+oraQuery2.FieldByName('KOD').AsString+#39;
                                 oraQuery10.ExecSQL;
                           StringGrid1.Cells[5,StringGrid1.RowCount-2]:=oraQuery2.FieldByName('oboznold').AsString+'  '+oraQuery10.FieldByName('name').AsString;
                          StringGrid1.Cells[6, StringGrid1.RowCount-2]:=oraQuery2.FieldByName('KOL').AsString;
                          StringGrid1.Cells[1, StringGrid1.RowCount-2]:=NOM;
                          StringGrid1.Cells[2, StringGrid1.RowCount-2]:=IntToStr(z);
                          StringGrid1.Cells[7, StringGrid1.RowCount-2]:=oraQuery2.FieldByName('NAMEK').AsString;
                          //*StringGrid1.Cells[1, StringGrid1.RowCount-2]:=NOM;
                          z:=z+1;

                         end;
                           z:=z+1;
                          Get_Doc(oraQuery2.FieldByName('TEX_TEXKOMPL_ID').AsString,oraQuery2.FieldByName('SPRAV_id').AsString);
                          Get_POD_Sostav(oraQuery2.FieldByName('TEX_TEXKOMPL_ID').AsString,oraQuery2.FieldByName('SPRAV_id').AsString);

                          oraQuery2.Next;
                         end;
            end;
        Result :=1;


    end;



    function Get_POD_Sostav(id,Sprav:string):integer;
       var tx:String;

    begin
id:= Form6.OraQuery8.FieldByName('tex_id').asstring;

tx:='Select nto.TEXKOMPL_ID,nto.TEXKOMPL_TEXKOMPL_ID, nt.TEXKOMPL_ID,nt.TEXKOMPL_TEXKOMPL_ID, ';
tx:=tx+' nt1.TEXKOMPL_ID,nt1.TEXKOMPL_TEXKOMPL_ID, nt1.NOMER,nt1.NAME, ';
tx:=tx+' NTM1.TEX_TEXKOMPL_ID ,ntm1.Sprav_sprav_ID, ntm1.kol, ntm1.type_relation_type_relation_id, ';
tx:=tx+' SPRAV1.SPRAV_id ,Sprav1.NAME, SPRAV1.kod ';
tx:=tx+'  from nordsy.texkompl nto ';
tx:=tx+'Right Join nordsy.texkompl nt on (nto.TEXKOMPL_ID=nt.TEXKOMPL_TEXKOMPL_ID) LEFT Join Nordsy.tx_mat NTM on nt.TEXKOMPL_ID= NTM.TEX_TEXKOMPL_ID ';
tx:=tx+'Right Join nordsy.texkompl nt1 on (nt.TEXKOMPL_ID=nt1.TEXKOMPL_TEXKOMPL_ID) LEFT Join Nordsy.tx_mat NTM1 on nt1.TEXKOMPL_ID= NTM1.TEX_TEXKOMPL_ID LEFT JOIN TRONIX.SPRAV SPRAV1 on ntm1.Sprav_sprav_ID=SPRAV1.SPRAV_id ';
tx:=tx+ ' where nto.TEXKOMPL_TEXKOMPL_ID='+#39+id+#39+' and (ntm1.Sprav_sprav_ID='+#39+Sprav+#39;// or ';
tx:=tx+ ' and (ntm1.type_relation_type_relation_id=10))';

Form6.oraQuery3.SQL.Text:=tx;
Form6.oraQuery3.ExecSQL;
id:=Form6.oraQuery3.FieldByName('TEXKOMPL_ID_2').asString ;
tx:='Select nto.TEXKOMPL_ID,NTM.kol, ';
tx:=tx+' SPRAV1.SPRAV_id ,Sprav1.NAME, SPRAV1.kod, ';
tx:=tx+' koded.NAMEK, Sprav1.oboznold';
tx:=tx+'  from nordsy.texkompl nto ';
tx:=tx+'LEFT Join Nordsy.tx_mat NTM on nto.TEXKOMPL_ID= NTM.TEX_TEXKOMPL_ID LEFT JOIN TRONIX.SPRAV SPRAV1 on ntm.Sprav_sprav_ID=SPRAV1.SPRAV_id ';
//tx:=tx+' LEFT join tronix.typ_lov tyl on  SPRAV1.TYP_LOV_TYP_LOV_ID=tyl.TYP_LOV_ID ';
tx:=tx+'LEFT JOIN TRONIX.koded koded on ntm.koded_koded_ID=koded.koded_id ';
tx:=tx+ 'where nto.TEXKOMPL_ID='+#39+id+#39;// or ';

Form6.oraQuery3.SQL.Text:=tx;
Form6.oraQuery3.ExecSQL;
//if Form6.OraQuery3.RecordCount>0 then ShowMessage('у  '+Sprav+' есть '+Form6.oraQuery3.FieldByName('TEX_TEXKOMPL_ID').AsString);
  if Form6.oraQuery3.RecordCount>0 Then
   begin
                         While NOT Form6.oraQuery3.EOF do
                         begin
                         if Form6.oraQuery3.FieldByName('SPRAV_id').asString=Sprav then
                         begin

                          Form6.StringGrid1.RowCount:=Form6.StringGrid1.RowCount+1;
                          Form6.StringGrid1.Cells[3,Form6.StringGrid1.RowCount-2]:=Form6.oraQuery3.FieldByName('NAME').AsString;
                          Form6.StringGrid1.Cells[4,Form6.StringGrid1.RowCount-2]:=Form6.oraQuery3.FieldByName('KOD').AsString;
                          Form6. oraQuery10.SQL.Text:='Select tl.name from tronix.typ_lov tl,tronix.sprav sp where sp.typ_lov_typ_lov_id=tl.typ_lov_id and sp.kod='+#39+ Form6.oraQuery3.FieldByName('KOD').AsString+#39;
                           Form6.oraQuery10.ExecSQL;

                          Form6.StringGrid1.Cells[5,Form6.StringGrid1.RowCount-2]:=Form6.oraQuery3.FieldByName('oboznold').AsString+'   '+Form6.oraQuery10.FieldByName('name').AsString;
                          Form6.StringGrid1.Cells[6, Form6.StringGrid1.RowCount-2]:=Form6.oraQuery3.FieldByName('KOL').AsString;
                          Form6.StringGrid1.Cells[2,  Form6.StringGrid1.RowCount-2]:=IntToStr(z);
                           Form6.StringGrid1.Cells[1, Form6.StringGrid1.RowCount-2]:=NOM;

                         Form6.StringGrid1.Cells[7, Form6.StringGrid1.RowCount-2]:=Form6.oraQuery3.FieldByName('NAMEK').AsString;
  Get_MARSHRUT_up( Form6.oraQuery3.FieldByName('TEXKOMPL_ID').AsString, Form6.oraQuery3.FieldByName('SPRAV_id').AsString,'1');
  Get_Doc(Form6.oraQuery3.FieldByName('TEXKOMPL_ID').AsString,Form6.oraQuery3.FieldByName('SPRAV_id').AsString);
                         end;
                          Form6.oraQuery3.Next;
                         end;




                         Form6.oraQuery3.First;

                         Form6.StringGrid1.RowCount:=Form6.StringGrid1.RowCount+1;
                         Form6.StringGrid1.Cells[3,Form6.StringGrid1.RowCount-2]:='В составе:  ';
                         Form6.StringGrid1.Cells[1, Form6.StringGrid1.RowCount-2]:=NOM;
  With Form6 Do
             Begin
                While NOT oraQuery3.EOF do
                         begin
                         if oraQuery3.FieldByName('SPRAV_id').asString<>Sprav then
                         begin

                          StringGrid1.RowCount:=StringGrid1.RowCount+1;
                          StringGrid1.Cells[3,StringGrid1.RowCount-2]:=oraQuery3.FieldByName('NAME').AsString;
                          StringGrid1.Cells[4,StringGrid1.RowCount-2]:=oraQuery3.FieldByName('KOD').AsString;
                          oraQuery10.SQL.Text:='Select tl.name from tronix.typ_lov tl,tronix.sprav sp where sp.typ_lov_typ_lov_id=tl.typ_lov_id and sp.kod='+#39+oraQuery3.FieldByName('KOD').AsString+#39;
                          oraQuery10.ExecSQL;

                     //     StringGrid1.Cells[5,StringGrid1.RowCount-2]:=oraQuery3.FieldByName('oboznold').AsString+'   '+oraQuery10.FieldByName('oboznold').AsString;
                          StringGrid1.Cells[6, StringGrid1.RowCount-2]:=oraQuery3.FieldByName('KOL').AsString;
                          StringGrid1.Cells[1, StringGrid1.RowCount-2]:=NOM;
                          StringGrid1.Cells[7, StringGrid1.RowCount-2]:=Form6.oraQuery3.FieldByName('NAMEK').AsString;
         Get_Doc(Form6.oraQuery3.FieldByName('TEXKOMPL_ID').AsString,Form6.oraQuery3.FieldByName('SPRAV_id').AsString);
         Get_MARSHRUT_up( Form6.oraQuery3.FieldByName('TEXKOMPL_ID').AsString, Form6.oraQuery3.FieldByName('SPRAV_id').AsString,'1');

                         end;
                          oraQuery3.Next;
                         end;
            end;
                                       Form6.StringGrid1.RowCount:=Form6.StringGrid1.RowCount+1;
                         Form6.StringGrid1.Cells[3,Form6.StringGrid1.RowCount-2]:='***********************  ';
                          Form6.StringGrid1.Cells[1, Form6.StringGrid1.RowCount-2]:=NOM;
            end;
        Result :=1;




    end;



function  Get_MARSHRUT(id,Sprav,type_relation:string):integer;
var tx,q:string;

begin
 with Form6 do
  begin

tx:='Select nto.TEXKOMPL_ID, nto.dep_dep_id, ';
tx:=tx+' NTM.TEX_TEXKOMPL_ID ,ntm.Sprav_sprav_ID, ntm.koded_koded_id,ntm.type_relation_type_relation_id, ';
tx:=tx+' Sprav.Sprav_id , ';
tx:=tx+' dep.dep_id ,dep.nomer, ';
tx:=tx+' orc.texcompl_befo ,orc.Texcompl_afto ';
tx:=tx+'  from nordsy.texkompl nto ';
tx:=tx+'Join Nordsy.tx_mat NTM on nto.TEXKOMPL_ID= NTM.TEX_TEXKOMPL_ID ';
tx:=tx+' JOIN TRONIX.SPRAV SPRAV on (ntm.Sprav_sprav_ID=SPRAV.SPRAV_id) and Sprav.Sprav_id='+ #39+Sprav+#39;
tx:=tx+'JOIN Nordsy.DEP dep on dep.dep_id=nto.dep_dep_id ';
tx:=tx+'LEFT JOIN Nordsy.tex_or_c orc on orc.texcompl_afto=nto.texkompl_id ';
tx:=tx+ ' where nto.TEXKOMPL_ID='+#39+id+#39;


 oraQuery4.SQL.Text:=tx;
 oraQuery4.ExecSQL;
 StringGrid1.Cells[8,StringGrid1.RowCount-2]:=oraQuery4.FieldByName('nomer').AsString+StringGrid1.Cells[8,StringGrid1.RowCount-2];
q:=id;
   while  q<>'0' do
     begin
   //  ShowMessage(id);
      q:=IntToStr(Get_MARSHRUT_full(id,SPRAv));
      id:=q;
     end;
 end;
end;


function Get_MARSHRUT_full(id,SPRAv:string):integer;
var tx:string;
begin
with Form6 do
 begin

 tx:='Select nto.TEXKOMPL_ID, nto.dep_dep_id, ';
 tx:=tx+' NTM.TEX_TEXKOMPL_ID ,ntm.Sprav_sprav_ID, ntm.koded_koded_id,ntm.type_relation_type_relation_id, ';
 tx:=tx+' orc.texcompl_befo ,orc.Texcompl_afto, ';
 tx:=tx+'nt1.TEXKOMPL_ID, nt1.dep_dep_id, ';
 tx:=tx+' dep1.nomer, ';
 tx:=tx+' NTM1.TEX_TEXKOMPL_ID ,ntm1.Sprav_sprav_ID, ntm1.koded_koded_id,ntm1.type_relation_type_relation_id ';
 tx:=tx+'  from nordsy.texkompl nto ';
 tx:=tx+'Join Nordsy.tx_mat NTM on nto.TEXKOMPL_ID= NTM.TEX_TEXKOMPL_ID ';
 tx:=tx+' JOIN Nordsy.tex_or_c orc on orc.texcompl_afto=nto.texkompl_id ';
 tx:=tx+'JOIN Nordsy.texkompl nt1 on orc.texcompl_befo=nt1.texkompl_id ';
 tx:=tx+'Join Nordsy.tx_mat NTM1 on nt1.TEXKOMPL_ID= NTM1.TEX_TEXKOMPL_ID and (ntm1.Sprav_sprav_ID='+ #39+Sprav+#39+')' ;
 tx:=tx+'JOIN Nordsy.DEP dep1 on dep1.dep_id=nt1.dep_dep_id ';
 tx:=tx+ ' where nto.TEXKOMPL_ID='+#39+id+#39;//+' and Ntm.Sprav_sprav_ID='+ #39+Sprav+#39;

 oraQuery5.SQL.Text:=tx;
 oraQuery5.ExecSQL;
   StringGrid1.Cells[8,StringGrid1.RowCount-2]:=oraQuery5.FieldByName('nomer').AsString+'  '+StringGrid1.Cells[8,StringGrid1.RowCount-2];
  result:= oraQuery5.FieldByName('texcompl_befo').AsInteger;
 end;
end;




function  Get_MARSHRUT_up(id,Sprav,type_relation:string):integer;
var tx,q:string;

begin
 with Form6 do
  begin

tx:='Select nto.TEXKOMPL_ID, nto.dep_dep_id, ';
tx:=tx+' NTM.TEX_TEXKOMPL_ID ,ntm.Sprav_sprav_ID, ntm.koded_koded_id,ntm.type_relation_type_relation_id, ';
tx:=tx+' Sprav.Sprav_id , ';
tx:=tx+' dep.dep_id ,dep.nomer, ';
tx:=tx+' orc.texcompl_befo ,orc.Texcompl_afto ';
tx:=tx+'  from nordsy.texkompl nto ';
tx:=tx+'Join Nordsy.tx_mat NTM on nto.TEXKOMPL_ID= NTM.TEX_TEXKOMPL_ID ';
tx:=tx+' JOIN TRONIX.SPRAV SPRAV on (ntm.Sprav_sprav_ID=SPRAV.SPRAV_id) and Sprav.Sprav_id='+ #39+Sprav+#39;
tx:=tx+'JOIN Nordsy.DEP dep on dep.dep_id=nto.dep_dep_id ';
tx:=tx+'LEFT JOIN Nordsy.tex_or_c orc on orc.texcompl_befo=nto.texkompl_id ';
tx:=tx+ ' where nto.TEXKOMPL_ID='+#39+id+#39;


 oraQuery4.SQL.Text:=tx;
 oraQuery4.ExecSQL;
 //*ShowMessage(OraQuery4.FieldByName('type_relation_type_relation_id').AsString);
 if   OraQuery4.FieldByName('type_relation_type_relation_id').AsString='' then
 StringGrid1.Cells[8,StringGrid1.RowCount-2]:='Поставка  '+StringGrid1.Cells[8,StringGrid1.RowCount-2];
  if   OraQuery4.FieldByName('type_relation_type_relation_id').AsString='8' then
  begin
    StringGrid1.Cells[8,StringGrid1.RowCount-2]:='=> '+StringGrid1.Cells[8,StringGrid1.RowCount-2];

     q:=id;
   while  q<>'0' do
     begin
     //ShowMessage(id);
      q:=IntToStr(Get_MARSHRUT_full(id,SPRAv));
      id:=q;
     end;
  result:=1;

  end;

 StringGrid1.Cells[8,StringGrid1.RowCount-2]:=StringGrid1.Cells[8,StringGrid1.RowCount-2]+oraQuery4.FieldByName('nomer').AsString;
q:=id;
//q:='0';
   while  q<>'0' do
     begin
      q:=IntToStr(Get_MARSHRUT_full_up(id,SPRAv));
      id:=q;
     end;
 end;
end;



function Get_MARSHRUT_full_up(id,SPRAv:string):integer;

var tx:string;
begin
with Form6 do
 begin

 tx:='Select nto.TEXKOMPL_ID, nto.dep_dep_id, ';
 tx:=tx+' NTM.TEX_TEXKOMPL_ID ,ntm.Sprav_sprav_ID, ntm.koded_koded_id,ntm.type_relation_type_relation_id, ';
 tx:=tx+' orc.texcompl_befo ,orc.Texcompl_afto, ';
 tx:=tx+'nt1.TEXKOMPL_ID, nt1.dep_dep_id, ';
 tx:=tx+' dep1.nomer, ';
 tx:=tx+' NTM1.TEX_TEXKOMPL_ID ,ntm1.Sprav_sprav_ID, ntm1.koded_koded_id,ntm1.type_relation_type_relation_id ';
 tx:=tx+'  from nordsy.texkompl nto ';
 tx:=tx+'Join Nordsy.tx_mat NTM on nto.TEXKOMPL_ID= NTM.TEX_TEXKOMPL_ID ';
 tx:=tx+' JOIN Nordsy.tex_or_c orc on orc.texcompl_befo=nto.texkompl_id ';
 tx:=tx+'JOIN Nordsy.texkompl nt1 on orc.texcompl_afto=nt1.texkompl_id ';
 tx:=tx+'Join Nordsy.tx_mat NTM1 on nt1.TEXKOMPL_ID= NTM1.TEX_TEXKOMPL_ID and (ntm1.Sprav_sprav_ID='+ #39+Sprav+#39+')' ;
 tx:=tx+'JOIN Nordsy.DEP dep1 on dep1.dep_id=nt1.dep_dep_id ';
 tx:=tx+ ' where nto.TEXKOMPL_ID='+#39+id+#39;//+' and Ntm.Sprav_sprav_ID='+ #39+Sprav+#39;

 oraQuery5.SQL.Text:=tx;
 oraQuery5.ExecSQL;  //* showMessage('!!!'+oraQuery5.FieldByName('texcompl_afto').AsString);
  if  oraQuery5.FieldByName('type_relation_type_relation_id').AsString='8' then
  StringGrid1.Cells[8,StringGrid1.RowCount-2]:=StringGrid1.Cells[8,StringGrid1.RowCount-2]+'=> ';
   StringGrid1.Cells[8,StringGrid1.RowCount-2]:=StringGrid1.Cells[8,StringGrid1.RowCount-2]+'  '+oraQuery5.FieldByName('nomer').AsString;
  result:= oraQuery5.FieldByName('texcompl_afto').AsInteger;
 end;
end;


  function Get_Doc(id,SPRAv:string):integer;
  var tx: String;
  p:integer;
  begin
  with Form6 do begin


    While NOT oraQuery7.EOF do
      begin

        if (sprav=oraQuery7.FieldByName('Sprav_id').AsString) and ((id=oraQuery7.FieldByName('texkompl_texkompl_id').AsString)
        or (id=oraQuery7.FieldByName('texcompl_befo').AsString) or (id=oraQuery7.FieldByName('texcompl_afto').AsString)
        or (id=oraQuery7.FieldByName('texcompl_afto_2').AsString) or (id=oraQuery7.FieldByName('texcompl_afto_3').AsString)
        or (id=oraQuery7.FieldByName('texcompl_afto_4').AsString) or (id=oraQuery7.FieldByName('texcompl_afto_1').AsString) or
        (id=oraQuery7.FieldByName('texkompl_id_1').AsString))

         then

            begin
            StringGrid1.Cells[9,StringGrid1.RowCount-2]:=//*oraQuery7.FieldByName('name_1').AsString+'  '+
            oraQuery7.FieldByName('nomer').AsString+' от '+oraQuery7.FieldByName('date_dok').AsString;
            StringGrid1.Cells[10,StringGrid1.RowCount-2]:=oraQuery7.FieldByName('user_date1').AsString;
            end;
       oraQuery7.Next;
      end;

      oraQuery7.First;

  end;
  end;
















procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
begin

with StringGrid1 do
  for i:=0 to ColCount-1 do
    Cols[i].Clear;

 Form6.StringGrid1.RowCount:=2;
 oraQuery7.Close;
 oraQuery6.Close;
 oraQuery5.Close;
 oraQuery4.Close;
 oraQuery3.Close;
 oraQuery2.Close;
 oraQuery1.Close;
  oraQuery8.Close;
  oraQuery10.Close;


end;

procedure TForm6.Button1Click(Sender: TObject);
var
ExcelApplication:TExcelApplication;
Range, Sheet: VAriant;
i,j, row:integer;



begin
ExcelApplication := TExcelApplication.Create(Self);
ExcelApplication.ConnectKind := ckNewInstance;
ExcelApplication.Connect;
ExcelApplication.AutoQuit := true;
ExcelWorkbook1.ConnectTo(ExcelApplication.Workbooks.Add(EmptyParam,LOCALE_USER_DEFAULT));
ExcelWorkBook1.Activate(LOCALE_USER_DEFAULT);
ExcelWorksheet1.ConnectTo(ExcelApplication.ActiveWorkbook.ActiveSheet as ExcelWorkSheet);


  Sheet := ExcelWorkbook1.Sheets[1];
  Range := Sheet.Columns;



for i := 1 to StringGrid1.ColCount do
begin

for j := 1 to StringGrid1.RowCount do
begin
 Sheet.Cells[j,i].NumberFormat :='@';
Sheet.Cells[j,i] := StringGrid1.Cells[i-1,j-1];


 end;
end;
 ExcelApplication.Visible[LOCALE_USER_DEFAULT] := true;

//ExcelApplication.ActiveWorkbook.SaveAs(EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,xlNoChange,
//EmptyParam,EmptyParam,
//EmptyParam,EmptyParam,EmptyParam,LOCALE_USER_DEFAULT);
//ExcelApplication.Workbooks.Close(LOCALE_USER_DEFAULT);
//ExcelApplication.Quit;
//*ExcelApplication.Disconnect;
//ExcelWorkbook1.Disconnect;
//ExcelWorksheet1.Disconnect;
//ExcelApplication.Free;
end;






end.
