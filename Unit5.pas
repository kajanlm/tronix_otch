unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, ExtCtrls, QuickRpt,
  GridsEh;

type
  TForm5 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    StringGrid1: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  Procedure GET_SOSTAV(Texkompl_id,d:integer);

implementation

uses Unit2;

{$R *.dfm}

procedure TForm5.FormShow(Sender: TObject);
var tx,tx1,id:string;
 d,rec: integer;
begin

//tx:='4925694';
    // oraQuery1.SQL.Text:='Select nto.TEXKOMPL_ID,nto.TEXKOMPL_TEXKOMPL_ID, nto.NOMER,nto.NAME, nt.TEXKOMPL_ID,nt.TEXKOMPL_TEXKOMPL_ID NTW1, nt.NOMER,nt.NAME  from nordsy.texkompl nto,nordsy.texkompl nt';
    // oraQuery1.SQL.ADD('Right Join nordsy.texkompl nt on (nto.TEXKOMPL_ID=NTw) ');
    //  oraQuery1.SQL.ADD('where nto.TEXKOMPL_TEXKOMPL_ID='+#39+tx+#39+' and (nto.TEXKOMPL_ID=NTW1)');

 id:=Form2.Edit3.Text;//*id:='5662832';
tx:='Select nto.TEXKOMPL_ID,nto.TEXKOMPL_TEXKOMPL_ID, nto.NOMER,nto.NAME,nto.TYPE_TEX_TYPE_TEX_ID, nt.TEXKOMPL_ID,nt.TEXKOMPL_TEXKOMPL_ID, nt.NOMER,nt.NAME,nt.TYPE_TEX_TYPE_TEX_ID, nt.w_level_msc, ';
tx:=tx+' nt1.TEXKOMPL_ID,nt1.TEXKOMPL_TEXKOMPL_ID, nt1.NOMER,nt1.NAME,nt1.TYPE_TEX_TYPE_TEX_ID,  nt1.msc_operation_id, nt1.w_level_msc, ';
tx:=tx+' NTM.TEX_TEXKOMPL_ID ,ntm.Sprav_sprav_ID, ntm.kol,ntm.koded_koded_id, ';
tx:=tx+' NTM1.TEX_TEXKOMPL_ID ,ntm1.Sprav_sprav_ID, ntm1.kol,ntm1.koded_koded_id, ntm1.type_relation_type_relation_id, ';
//***tx:=tx+' SPRAV.SPRAV_id ,Sprav.NAME, SPRAV.kod, ';
tx:=tx+' SPRAV1.SPRAV_id ,Sprav1.NAME, SPRAV1.kod, ';
tx:=tx+' oper.operation_id ,oper.nomer, oper.dep_dep_id, ';
tx:=tx+' dep.dep_id ,dep.nomer,dep.name, ';
tx:=tx+' orc.texcompl_befo ,orc.Texcompl_afto, ';
tx:=tx+' orc1.texcompl_befo ,orc1.Texcompl_afto, ';
tx:=tx+' orc2.texcompl_befo ,orc2.Texcompl_afto, ';
tx:=tx+' orc3.texcompl_befo ,orc3.Texcompl_afto, ';
tx:=tx+' orc4.texcompl_befo ,orc4.Texcompl_afto ';


tx:=tx+'  from nordsy.texkompl nto ';
tx:=tx+'Right Join nordsy.texkompl nt on (nto.TEXKOMPL_ID=nt.TEXKOMPL_TEXKOMPL_ID) LEFT Join Nordsy.tx_mat NTM on nt.TEXKOMPL_ID= NTM.TEX_TEXKOMPL_ID '; //***LEFT JOIN TRONIX.SPRAV SPRAV on ntm.Sprav_sprav_ID=SPRAV.SPRAV_id ';
tx:=tx+'Right Join nordsy.texkompl nt1 on (nt.TEXKOMPL_ID=nt1.TEXKOMPL_TEXKOMPL_ID) LEFT Join Nordsy.tx_mat NTM1 on nt1.TEXKOMPL_ID= NTM1.TEX_TEXKOMPL_ID LEFT JOIN TRONIX.SPRAV SPRAV1 on ntm1.Sprav_sprav_ID=SPRAV1.SPRAV_id ';
tx:=tx+'LEFT JOIN Nordsy.operation Oper on oper.operation_id=nt1.msc_operation_id ';
tx:=tx+'LEFT JOIN Nordsy.DEP dep on dep.dep_id=oper.dep_dep_id ';
tx:=tx+'LEFT JOIN Nordsy.tex_or_c orc on orc.texcompl_befo=nt1.texkompl_id ';
tx:=tx+'LEFT JOIN Nordsy.tex_or_c orc1 on orc1.texcompl_befo=orc.Texcompl_afto ' ;
tx:=tx+'LEFT JOIN Nordsy.tex_or_c orc2 on orc2.texcompl_befo=orc1.Texcompl_afto ' ;
tx:=tx+'LEFT JOIN Nordsy.tex_or_c orc3 on orc3.texcompl_befo=orc2.Texcompl_afto ' ;
tx:=tx+'LEFT JOIN Nordsy.tex_or_c orc4 on orc4.texcompl_befo=orc3.Texcompl_afto ' ;
tx:=tx+' JOIN tronix.ttn_mat ttn_mat1 on (ttn_mat1.texkompl_texkompl_id_from=nto.TEXKOMPL_ID) and (ttn_mat1.Sprav_sprav_id=SPRAV1.SPRAV_id)';

tx:=tx+ ' where nto.TEXKOMPL_TEXKOMPL_ID='+#39+id+#39;
// and (NOT exists (Select orc.texcompl_befo ,orc.Texcompl_afto from Orc where orc.texcompl_befo=nt1.texkompl_id))  ';
// and NOT in  Select orc.texcompl_befo ,orc.Texcompl_afto from Orc where orc.texcompl_befo=nt1.texkompl_id)  ' ;// and orc.texcompl_befo is NULL';
//tx:=tx+'order by sprav1.Sprav_id asc, oper.nomer ';
 tx:=tx+'order by nt1.TEXKOMPL_ID asc ';//**, oper.nomer asc ';
 //tx:=tx+'group by sprav1.Sprav_id ';
  oraQuery1.SQL.Text:=tx;
      ShowMessage(tx);

     oraQuery1.ExecSQL;


 end;







 Procedure GET_SOSTAV(Texkompl_id,d:integer);
 var kompl_sbor,tx:string;

begin
  //ShowMessage(IntToStr(Sprav_id));
   Form5.oraQuery1.First; kompl_sbor:='';
   While NOT Form5.oraQuery1.EOF do
     begin
           if  Form5.oraQuery1.FieldByName('texcompl_afto').AsString=IntToStr(Texkompl_id) then
           begin
           kompl_sbor:=Form5.oraQuery1.FieldByName('texcompl_befo').AsString;
           ShowMessage(kompl_sbor);
           end;

      Form5.oraQuery1.Next;
      end;

end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   StringGrid1.Destroy;
end;

end.
