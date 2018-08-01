unit Unit26;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, Ora, Grids, DBGridEh,DBGridEhImpExp,
  ExcelXP, OleServer, GridsEh;

type
  TForm26 = class(TForm)
    Edit1: TEdit;
    OraDataSource1: TOraDataSource;
    OraQuery1: TOraQuery;
    DBGridEh1: TDBGridEh;
    OraQuery1sprkod: TStringField;
    OraQuery1spname: TStringField;
    OraQuery1name: TStringField;
    OraQuery1spr_koded: TStringField;
    OraQuery1sm: TFloatField;
    OraQuery1spr_koded2: TStringField;
    OraQuery1sm2: TFloatField;
    OraQuery1Texkompl_name: TStringField;
    Button1: TButton;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    SaveDialog1: TSaveDialog;
    OraQuery1KOD: TStringField;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure OraQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form26: TForm26;
  z:string;
implementation

{$R *.dfm}

procedure TForm26.FormShow(Sender: TObject);
var tx: string;
begin
z:='';
tx:='Select sprkod,spname,name,spr_koded,round(sum(suma),2) sm,spr_koded2,round(sum( suma2),2) sm2,texkompl_name ';
tx:=tx+' from  ';
tx:=tx+' (Select potr.sprav_sprav_id spr_id,(Select kod from tronix.sprav where sprav_id=potr.sprav_sprav_id) as sprkod,  ';
tx:=tx+' (Select name from tronix.sprav where sprav_id=potr.sprav_sprav_id) ||'' ''||';
tx:=tx+' (Select name from tronix.tip_lov where tip_lov_id=(Select tip_lov_tip_lov_id from tronix.sprav where sprav_id=potr.sprav_sprav_id))||'' ''||';
tx:=tx+'(Select name from tronix.ty_lov where ty_lov_id=(Select ty_lov_ty_lov_id from tronix.sprav where sprav_id=potr.sprav_sprav_id))||'' ''||';
tx:=tx+'(Select name from tronix.tym_lov where tym_lov_id=(Select tym_lov_tym_lov_id from tronix.sprav where sprav_id=potr.sprav_sprav_id))||'' ''||';
tx:=tx+'(Select name from tronix.typ_lov where typ_lov_id=(Select typ_lov_typ_lov_id from tronix.sprav where sprav_id=potr.sprav_sprav_id))||'' ''||';
tx:=tx+'(Select name from tronix.raz_lov where raz_lov_id=(Select raz_lov_raz_lov_id from tronix.sprav where sprav_id=potr.sprav_sprav_id))spname,  ';
tx:=tx+' (potr.kol*tronix_kof_koded(spr.sprav_id,spr.koded_koded_id, potr.koded_koded_id)) suma,  ';
tx:=tx+' (Select namek from tronix.koded where koded_ID=(Select koded_koded_id from tronix.sprav  where sprav_id=potr.sprav_sprav_id)) spr_koded,  ';
tx:=tx+' (Select namek from tronix.koded where koded_ID=(Select koded_koded_id2 from tronix.sprav where sprav_id=potr.sprav_sprav_id)) spr_koded2,  ';
tx:=tx+' (potr.kol*tronix_kof_koded(spr.sprav_id,potr.koded_koded_id,spr.koded_koded_id2)) suma2,  ';
tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=nordsy.GET_UP_TTN(potr.texkompl_texkompl_id ,12)) texkompl_name,  ';
tx:=tx+'  NORDSY.GET_UP_TTN(potr.texkompl_texkompl_id ,12)  texkompl,  ';
tx:=tx+' do.ident  name  ';
tx:=tx+' from tx_car_potr potr, tronix.sprav spr,tronix.sp sp, tronix.document do  ';
tx:=tx+' where potr.texkompl_texkompl_id in  ';
tx:=tx+' (  ';
tx:=tx+'  Select  t.texkompl_id  ';
tx:=tx+' from  ';
tx:=tx+' (  ';
tx:=tx+' Select texkompl_id,dep_dep_id  ';
tx:=tx+' from tx_texkompl   ';
tx:=tx+' connect by prior texkompl_id=texkompl_texkompl_id  ';
tx:=tx+' start with texkompl_id=(Select texkompl_id from tx_texkompl where texkompl_texkompl_id is null and project_project_id=230 and nsort=1)) t  ';   //djn тут!!!!!!!!
tx:=tx+' where t.dep_dep_id in  (Select dep_id from nordsy.dep where dep_dep_id=4017 or dep_id=4017)  ';
tx:=tx+' )  ';
tx:=tx+' and spr.sprav_id=potr.sprav_sprav_id  ';
tx:=tx+'  and ((tronix_select_mat( spr.tree_tree_id, ''01'' ) = 1) and  (can_do_self is null or can_do_self=0))  ';
tx:=tx+' and tronix_select_mat( spr.tree_tree_id, ''011'' ) = 0  ';
tx:=tx+' and sp.nn(+)= potr.sp_id_from  ';
tx:=tx+' and sp.nnn=do.document_id(+)  ';
tx:=tx+' )  ';
tx:=tx+' group by  sprkod,spname,name,spr_koded,texkompl_name,spr_koded2  ';
tx:=tx+' order by sprkod  ';
ShowMessage(tx);
   OraQuery1.SQL.Text:=tx;
  OraQuery1.ExecSQL;

end;

procedure TForm26.Button1Click(Sender: TObject);
var
ExcelApplication:TExcelApplication;
Range, Sheet: VAriant;
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


 with SaveDialog1 do
  begin
  InitialDir :=ExtractFilePath(Application.ExeName);
  Filter :='Exell files (*.xls)|*.xls|All files (*.*)|*.*';
   if SaveDialog1.Execute then begin
  SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,SaveDialog1.FileName+ '.xls' ,true);
  end;
end;
end ;


procedure TForm26.OraQuery1CalcFields(DataSet: TDataSet);
begin
      if    OraQuery1.FieldByName('sprkod').AsString<>z then
              begin
               OraQuery1.FieldByName('KOD').Value:=OraQuery1.FieldByName('sprkod').AsString ;
               z:=OraQuery1.FieldByName('sprkod').AsString ;
       end;
end;

end.
