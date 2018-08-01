unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, StdCtrls, ComCtrls,
  OleServer, ExcelXP, PropStorageEh,DBGridEhImpExp, GridsEh;

type
  TForm7 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    OraQuery1NAME: TStringField;
    OraQuery1tn_nomer: TStringField;
    OraQuery1date_dok: TStringField;
    OraQuery1tk_nomer: TStringField;
    OraQuery1ident: TStringField;
    OraQuery1poz: TStringField;
    OraQuery1spname: TStringField;
    OraQuery1edu: TStringField;
    OraQuery1kod: TStringField;
    OraQuery1ed: TStringField;
    OraQuery1t_nomer: TStringField;
    OraQuery1t_date_dok: TStringField;
    OraQuery1kol1: TStringField;
    OraQuery1tr: TStringField;
    OraQuery1NAkl_nom: TStringField;
    OraQuery1Nakl_date: TStringField;
    OraQuery2: TOraQuery;
    OraQuery3: TOraQuery;
    OraQuery1idsp: TFloatField;
    OraQuery1ttnid: TFloatField;
    Button1: TButton;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    SaveDialog1: TSaveDialog;
    OraQuery1kol: TStringField;
    procedure FormShow(Sender: TObject);
    procedure OraQuery1CalcFields(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
implementation

uses Unit8;

{$R *.dfm}

procedure TForm7.FormShow(Sender: TObject);
var tx,s:string;
begin
s:=form8.label1.caption;
tx:='';
if Form8.CheckBox1.Checked= true then
   begin
tx:=tx+'select name, tn_nomer ,date_dok ,tk_nomer,ident,'''' poz, kod, spname,';
tx:=tx+'  to_char(sum(kol)) kol,edu,';
tx:=tx+'  t_nomer, t_date_dok, to_char(Sum(kol1)) kol1,ed,';
tx:=tx+'  tr, idsp, ttnid';
tx:=tx+' from (';
   end;
tx:=tx+'select ll.name, ll.tn_nomer ,ll.date_dok ,ll.tk_nomer,ll.ident, ll.poz, ll.kod, ll.spname,';
tx:=tx+' decode(nvl(sum(nvl(ll.tm_kol_uchet,0)),0),0,'''' ,nvl(sum(nvl(ll.tm_kol_uchet,0)),0)) kol,ll.edu,';
tx:=tx+'  ll.t_nomer, ll.t_date_dok,decode(nvl(sum(nvl(ll.t_kol_uchet,0)),0),0,'''',nvl(sum(nvl(ll.t_kol_uchet,0)),0)) kol1,ll.ed,';
tx:=tx+' replace(ll.tntn,chr(10)) tr, ll.idsp, ll.ttnid';
tx:=tx+' from ';
tx:=tx+'(select ''aaa'' ,tn.nomer tn_nomer,tk.nomer tk_nomer,sp.kod kod,';
tx:=tx+' sum(nvl(tm.kol_uchet,0)) tm_kol_uchet,edu.namek edu,';
tx:=tx+' do.ident ident, (spp.poz||decode(spp.podpoz,null,'''',spp.podpoz)) poz, t.nomer t_nomer, to_char(t.t_date_dok,'+#39+'DD.MM.YYYY'+#39+') t_date_dok, ';
tx:=tx+'  sum(nvl(t.kol_uchet,0)) t_kol_uchet,   t.ed ed, dt.nomer name, tronix_sp_name(sp.sprav_id) spname,  sp.sprav_id idsp, ';
tx:=tx+'  to_char(tn.date_dok,'+#39+'DD.MM.YYYY'+#39+') date_dok,  tx_get_ttn(sp.sprav_id,zk.project_id,'+#39+'ALL'+#39+') tntn, t.idtk ttnid ';
tx:=tx+' from tronix.ttn_mat tm, tronix.ttn tn,  tronix.sprav sp, tronix.koded edu, tronix.document do, tronix.sp spp, ';
tx:=tx+' kadry_dep df, kadry_dep dt, tx_texkompl tk,  tx_zakaz zk, ';
tx:=tx+'(select tnn.nomer nomer,tnn.date_dok t_date_dok, tnn.texkompl_texkompl_id idtk,tnn.ttn_ttn_id_req req,tmm.sprav_sprav_id ids, ';
tx:=tx+' tmm.kol_uchet kol_uchet,ed.namek ed,spt.kod kod ';
tx:=tx+' from    tronix.ttn_mat tmm, ';
tx:=tx+'  tronix.ttn tnn, tronix.koded ed,  tronix.sprav spt,  tx_zakaz zk ';
tx:=tx+'   where ';
tx:=tx+' zk.zavn=upper('+S+') and tnn.project_project_id=zk.project_id  and tnn.ttn_ttn_id_req is not null ';
tx:=tx+' and tmm.ttn_ttn_id=tnn.ttn_id(+) and tmm.sprav_sprav_id=spt.sprav_id(+) and tmm.koded_koded_id_uchet=ed.koded_id(+)';
tx:=tx+') t ';
tx:=tx+' where tm.ttn_ttn_id=tn.ttn_id(+) ';
tx:=tx+' and tn.type_ttn_type_ttn_id=20 ';
tx:=tx+'  and tn.dep_dep_id_from=df.dep_id(+) ';
tx:=tx+' and tn.dep_dep_id_to=dt.dep_id(+) ';
tx:=tx+' and df.nomer='+#39+'25-ÖÊÑ'+#39;
tx:=tx+' and tm.sprav_sprav_id=sp.sprav_id(+)' ;
tx:=tx+'  and tm.koded_koded_id_uchet=edu.koded_id(+) ';
tx:=tx+' and tn.texkompl_texkompl_id=tk.texkompl_id(+) ';
tx:=tx+' and tm.sp_sp_id=spp.nn(+) ';
tx:=tx+' and spp.nnn=do.document_id(+) ';
tx:=tx+' and tn.ttn_id=t.req(+) ';
tx:=tx+'  and t.idtk=tn.texkompl_texkompl_id ';
tx:=tx+'  and t.ids=tm.sprav_sprav_id';
tx:=tx+'  and tm.kol_uchet>t.kol_uchet ';
tx:=tx+'   and tn.user_date1 is not null ';
tx:=tx+'  and zk.zavn=upper('+S+')';
tx:=tx+' and tn.project_project_id=zk.project_id';
tx:=tx+' group by dt.nomer,tn.nomer,tk.nomer,do.ident,(spp.poz||decode(spp.podpoz,null,'''',spp.podpoz)),sp.kod,sp.sprav_id, ';
tx:=tx+'   edu.namek,t.nomer,to_char(t.t_date_dok,'+#39+'DD.MM.YYYY'+#39+'), tronix_sp_name(sp.sprav_id),t.ed,to_char(tn.date_dok,'+#39+'DD.MM.YYYY'+#39+'),tx_get_ttn(sp.sprav_id,zk.project_id,'+#39+'ALL'+#39+'),t.idtk';

tx:=tx+' union';
tx:=tx+' select ''bbb'',tn.nomer tn_nomer,tk.nomer tk_nomer,sp.kod kod,sum(nvl(tm.kol_uchet,0)) tm_kol_uchet,edu.namek edu,';
tx:=tx+'  do.ident ident,';
tx:=tx+' (spp.poz||decode(spp.podpoz,null,'''',spp.podpoz)) poz, ';
tx:=tx+'    '' '' t_nomer, ';
tx:=tx+''' '' t_date_dok,';
tx:=tx+'  0 kol_uchet,';
tx:=tx+' '' '' ed,';
tx:=tx+'dt.nomer name,';
tx:=tx+'tronix_sp_name(sp.sprav_id) spname,';
tx:=tx+' sp.sprav_id idsp,';
tx:=tx+' to_char(tn.date_dok,''DD.MM.YYYY'') date_dok,';
tx:=tx+' tx_get_ttn(sp.sprav_id,zk.project_id,''ALL'') tntn,  0 ttnid ';
tx:=tx+'  from tronix.ttn_mat tm,';
tx:=tx+' tronix.ttn tn,';
tx:=tx+' tronix.sprav sp,';
tx:=tx+'  tronix.koded edu, ';
tx:=tx+'  tronix.document do,';
tx:=tx+'  tronix.sp spp, ';
tx:=tx+'  kadry_dep df, ';
tx:=tx+'  kadry_dep dt, ';
tx:=tx+' tx_texkompl tk, ';
tx:=tx+' tx_zakaz zk ';
tx:=tx+' where tm.ttn_ttn_id=tn.ttn_id(+) ';
tx:=tx+' and tn.type_ttn_type_ttn_id=20 ';
tx:=tx+' and tn.dep_dep_id_from=df.dep_id(+) ';
tx:=tx+' and tn.dep_dep_id_to=dt.dep_id(+) ';
tx:=tx+' and df.nomer=''25-ÖÊÑ''';
tx:=tx+'  and tm.sprav_sprav_id=sp.sprav_id(+)';
tx:=tx+' and tm.koded_koded_id_uchet=edu.koded_id(+)';
tx:=tx+' and tn.texkompl_texkompl_id=tk.texkompl_id(+)';
tx:=tx+' and tm.sp_sp_id=spp.nn(+) ';
tx:=tx+' and spp.nnn=do.document_id(+)  ';
tx:=tx+' and zk.zavn=upper('+S+')';
tx:=tx+' and tn.project_project_id=zk.project_id';
tx:=tx+' and tn.user_date1 is not null';
tx:=tx+'   and (1>(select count (*) ';
tx:=tx+'   from tronix.ttn_mat tmm,tronix.ttn tnn,tx_zakaz zk ';
tx:=tx+' where zk.zavn=upper('+S+') ';
tx:=tx+'  and tnn.project_project_id=zk.project_id';
tx:=tx+'  and tnn.ttn_ttn_id_req = tn.ttn_id';
tx:=tx+'  and tmm.ttn_ttn_id=tnn.ttn_id(+)';
tx:=tx+' and tmm.sprav_sprav_id=tm.sprav_sprav_id))';
tx:=tx+'  group by dt.nomer,tn.nomer,tk.nomer,do.ident,(spp.poz||decode(spp.podpoz,null,'''',spp.podpoz)),sp.kod,sp.sprav_id,';
tx:=tx+' edu.namek,'' '','' '',tronix_sp_name(sp.sprav_id),'' '',to_char(tn.date_dok,''DD.MM.YYYY''),tx_get_ttn(sp.sprav_id,zk.project_id,''ALL''), '''' ';




tx:=tx+' ) ll';
tx:=tx+' group by ll.name,ll.tn_nomer,ll.tk_nomer,ll.ident,ll.poz,ll.kod,ll.tm_kol_uchet,ll.edu,ll.t_nomer,ll.spname,ll.ed,ll.t_date_dok,ll.date_dok,replace(ll.tntn,chr(10)),ll.idsp,ll.ttnid ';
tx:=tx+' order by ll.name,ll.tn_nomer,ll.tk_nomer,ll.ident,ll.poz,ll.kod,ll.t_nomeR ';


if Form8.CheckBox1.Checked= true then
tx:=tx+') group by name, tn_nomer ,date_dok ,tk_nomer,ident, kod, spname,edu,t_nomer, t_date_dok, ed, tr, idsp, ttnid';
 oraQuery1.SQL.Text:=tx;

oraQuery1.ExecSQL;
//   showMessage(IntToStr(OraQuery1.RecordCount));

end;

procedure TForm7.OraQuery1CalcFields(DataSet: TDataSet);
var tx,s,tx1,tt,text_doc,text_doc_data:string;
begin
 s:=form8.label1.caption;
  tx:='Select nomer, date_dok  from tronix.ttn, tronix.ttn_mat where ';
  tx:=tx+'ttn_mat.texkompl_texkompl_id_from='+oraQuery1.FieldByName('ttnid').AsString;
  tx:=tx+' and ttn_mat.sprav_sprav_id= '+oraQuery1.FieldByName('idsp').AsString;
  tx:=tx+' and ttn.type_ttn_type_ttn_id=34 ';
  tx:=tx+'and ttn.ttn_id=ttn_mat.ttn_ttn_id ';

   tx:=oraQuery1.FieldByName('tr').asString;
    tx1:=tx;
   if Length(tx)>0  then
     begin
       while Length(tx1)>0 do begin
       if Pos(',',tx)>0 then
          tx1:=copy(tx, Pos(',',tx)+1,Length(tx));


        if Pos(',',tx)>0 then

         tx:=Copy(tx, 0,Pos(',',tx)-1)
         else
          tx1:='';


      if Pos('[',tx)>0 then
       tx:=Copy(tx,Pos(']',tx)+1,Length(tx));

       if Pos('(',tx)>0 then
       tx:=Copy(tx,0,Pos('(',tx)-1);


       tt:='Select t.texkompl_id tx,ttr.nomer,ttr.user_date1 from tx_texkompl t, tx_zakaz zk, tronix.ttn_mat tmat, tronix.ttn ttr';
       tt:=tt+' where zk.zavn=upper('+#39+S+#39+')';
       tt:=tt+' and t.nomer='+#39+tx+#39;
       tt:=tt+' and t.project_project_id=zk.project_id ';
       tt:=tt+' and t.texkompl_id=tmat.texkompl_texkompl_id_from ';
       tt:=tt+' and ttr.ttn_id=tmat.ttn_ttn_id ';
       tt:=tt+' and tmat.sprav_sprav_id='+#39+oraQuery1.FieldByName('idsp').AsString+#39;
       tt:=tt+' group by t.texkompl_id,ttr.nomer,ttr.user_date1 ';



        oraQuery2.SQL.Text:=tt;
      oraQuery2.ExecSQL; text_doc:=''; text_doc_data:='';
     While NOT oraQuery2.EOF do
       begin
     text_doc:=text_doc+' '+oraQuery2.FieldByName('nomer').asString;
     text_doc_data:=text_doc_data+' '+oraQuery2.FieldByName('user_date1').asString;
       oraQuery2.Next;
       end;
       oraQuery1.FieldByName('Nakl_nom').Value:=text_doc;
       oraQuery1.FieldByName('Nakl_date').Value:=text_doc_data;

     tx:=tx1;

    end;
   end;

end;

procedure TForm7.Button1Click(Sender: TObject);

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


 with SaveDialog1 do
  begin
  InitialDir :=ExtractFilePath(Application.ExeName);
  Filter :='Exell files (*.xls)|*.xls|All files (*.*)|*.*';

   if SaveDialog1.Execute then begin
  //  ShowMessage(SaveDialog1.FileName);
  SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,SaveDialog1.FileName+'.xls',true);
  end;
end;
 end;

end.
