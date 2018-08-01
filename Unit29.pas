unit Unit29;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExcelXP, OleServer, StdCtrls, Buttons, DB,DBGridEhImpExp,
  DBAccess, Ora, MemDS, GridsEh;

type
  TForm29 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    BitBtn1: TBitBtn;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    DBGridEh1: TDBGridEh;
    SaveDialog1: TSaveDialog;
    Edit3: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form29: TForm29;

implementation

uses Unit30, Unit27, Unit36;

{$R *.dfm}

procedure TForm29.FormShow(Sender: TObject);
var tx:string;
begin
tx:='';
if Form27.CheckBox2.Checked=true then
 tx:=' Select name,sprname,sprkod, potr,zavod,cex, vidano,nomer_tk,spavname,up_texkompl_id, TTN_NUM,sprav_id, fred from (';


tx:=tx+' Select name,sprname,sprkod, potr,zavod,cex, vidano,nomer_tk,spavname,up_texkompl_id, TTN_NUM,sprav_id ';
tx:=tx+' ,fred';
tx:=tx+' from';
tx:=tx+' (Select fred,name,sprname,sprkod,nvl(round(sum(suma_potr),4),0) potr,round(sum(suma_zavod),4) zavod,round(sum(suma_vcexe),4) cex,nvl(round(summ_vidano,4),0) vidano,nomer_tk,spavname,up_texkompl_id, TTN_NUM,sprav_id ';
tx:=tx+' from ';
tx:=tx+' ( ';
tx:=tx+' Select potr.sprav_sprav_id spr_id,(potr.kol*tronix_kof_koded(spr.sprav_id,spr.koded_koded_id, potr.koded_koded_id)) suma_potr , ';
tx:=tx+' (potr.zapas_post*tronix_kof_koded(spr.sprav_id,spr.koded_koded_id, potr.koded_koded_id)) suma_zavod, ';
tx:=tx+'  (potr.zapas_post_tr*tronix_kof_koded(spr.sprav_id,spr.koded_koded_id, potr.koded_koded_id)) suma_vcexe, ';
tx:=tx+' (Select sum(zap.kol_uchet*tronix_kof_koded(potr.sprav_sprav_id,zap.koded_koded_id_uchet, potr.koded_koded_id)) from tronix.zapas zap ';
tx:=tx+' where zap.sp_sp_id=potr.sp_id_from ';
tx:=tx+'  and zap.sprav_sprav_id=potr.sprav_sprav_id) summ_vidano, ';
tx:=tx+' potr.texkompl_texkompl_id texkompl,do.ident||'' ''||''Поз(''||sp.poz||'')  ''||sp.podpoz||'' ''||sp.name as name, sp.nn spnn, sp.kod spkod, ';
tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=potr.texkompl_texkompl_id) nomer_tk, ';
tx:=tx+' spr.name sprname, spr.kod sprkod,spr.sprav_id sprav_id,';
tx:=tx+' (Select name from tronix.sprav where sprav_id=potr.sprav_sprav_id) spavname, ';
tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=nordsy.GET_UP_TTN(potr.texkompl_texkompl_id,7)) up_texkompl_id, ';
tx:=tx+' nordsy.get_TTN(potr.sprav_sprav_id,'+Edit2.text+',''ALL'') TTN_NUM, ';
tx:=tx+' (Select name from tronix.typ_lov  where typ_lov_id=(Select typ_lov_typ_lov_id from tronix.sprav t where potr.sprav_sprav_id=t.sprav_id)) fred';
tx:=tx+' from tx_car_potr potr, tronix.sprav spr , tronix.sp sp, tronix.document do ';
tx:=tx+' where spr.sprav_id=potr.sprav_sprav_id ';
//---and tronix_select_mat( spr.tree_tree_id, '01' ) = 1 ';
tx:=tx+' and  spr.can_do_self =1 ';
tx:=tx+'  and sp.nn(+)= potr.sp_id_from ';
tx:=tx+'  and sp.nnn=do.document_id(+) ';
tx:=tx+' and potr.texkompl_texkompl_id in ';
tx:=tx+' (Select  tx.texkompl_id ';
tx:=tx+' from tronix.sp sp, tronix.document do,nordsy.tx_mat tmat,tx_texkompl tx ';
tx:=tx+' where ';
tx:=tx+' do.document_id in ('+Edit1.text+')';
tx:=tx+' and  sp.nnn=do.document_id ';
tx:=tx+' and  sp.nn=tmat.sp_sp_id ';
tx:=tx+' and tx.texkompl_id=tmat.tex_texkompl_id ';
if Edit3.Text<>'All' then
tx:=tx+' and tx.dep_dep_id in  (Select dep_id from nordsy.dep where dep_dep_id='+Edit3.Text+' or dep_id='+Edit3.Text+') ';
tx:=tx+'  group by texkompl_id) ';
tx:=tx+' ) ';
tx:=tx+' group by nomer_tk,name, spkod,spr_id,sprname,sprkod,spavname,summ_vidano,up_texkompl_id,TTN_NUM,sprav_id,fred ';
tx:=tx+' order by name )';
if Form27.CheckBox2.Checked=true then
tx:=tx+' where  (potr-zavod)>0) where (potr-vidano)>0 ';
//       ShowMessage(tx);
     OraQuery1.SQL.Text:=tx;
  OraQuery1.ExecSQL;
end;

procedure TForm29.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 OraQuery1.Close;
end;

procedure TForm29.BitBtn1Click(Sender: TObject);
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

end;


procedure TForm29.DBGridEh1DblClick(Sender: TObject);
begin

 form30.Caption:='Выберите ТН';
  Form30.Edit1.Text:=oraQuery1.FieldByName('sprav_id').asString;
  Form30.Edit2.Text:=Edit2.text;
  form30.ShowModal();
end;

end.
