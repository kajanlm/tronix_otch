unit Unit36;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MemTableDataEh, Db, GridsEh, DBGridEh, DBAccess, Ora,
  MemTableEh, DataDriverEh, MemDS,DBGridEhImpExp, ExcelXP, OleServer, ComObj,
  ComCtrls,EhLibADO;

type
  TForm36 = class(TForm)
    Edit1: TEdit;
    OraQuery1: TOraQuery;
    DataSetDriverEh1: TDataSetDriverEh;
    MemTableEh1: TMemTableEh;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    OraQuery1nomer: TStringField;
    OraQuery1name: TStringField;
    OraQuery1trudoem: TFloatField;
    OraQuery1dep: TStringField;
    OraQuery1texkompl_id: TFloatField;
    OraQuery1texkompl_texkompl_id: TFloatField;
    OraQuery1pdate_beg: TStringField;
    OraQuery1pdate_end: TStringField;
    OraQuery2: TOraQuery;
    OraQuery1doc: TStringField;
    MemTableEh1nomer: TStringField;
    MemTableEh1doc: TStringField;
    MemTableEh1trudoem: TFloatField;
    MemTableEh1name: TStringField;
    MemTableEh1texkompl_id: TFloatField;
    MemTableEh1texkompl_texkompl_id: TFloatField;
    MemTableEh1dep: TStringField;
    MemTableEh1pdate_beg: TStringField;
    MemTableEh1pdate_end: TStringField;
    OraQuery1otk_end: TStringField;
    MemTableEh1otk_end: TStringField;
    Button1: TButton;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    SaveDialog1: TSaveDialog;
    OraQuery1type_tex: TFloatField;
    MemTableEh1type_tex: TFloatField;
    MonthCalendar1: TMonthCalendar;
    OraQuery3: TOraQuery;
    OraQuery1nar: TFloatField;
    MemTableEh1nar: TFloatField;
    Button2: TButton;
    OraQuery4: TOraQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1ColExit(Sender: TObject);
    procedure MonthCalendar1DblClick(Sender: TObject);
    procedure OraQuery1AfterPost(DataSet: TDataSet);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure OraQuery1AfterScroll(DataSet: TDataSet);
    procedure DBGridEh1ApplyFilter(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    parametr: string;
  end;

var
  Form36: TForm36;
  index:Integer;
  FExcel,Sheet,Colum:Variant;

implementation

uses Unit9, Unit27, Unit33, Unit37, Unit39, Unit41, Unit48;

{$R *.dfm}

procedure TForm36.FormShow(Sender: TObject);
var tx: string;
begin
///*****Описываю поля******////

  OraQuery1.Fields.Clear; ///Убрать
  MemTableEh1.Fields.Clear;

 With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'nomer';
    Size := 45  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

   With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'name';
    Size := 100;
          DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

   With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'dep';
          DataSet:=OraQuery1;
    FieldKind:=fkDAta;
   end;

   With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'pdate_beg' ;
          DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

      With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'pdate_end';
          DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

   With TStringField.Create(OraQuery1) do
   begin
         FieldName := 'doc';
      Size := 1000;
            DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;
       With TStringField.Create(OraQuery1) do
   begin
         FieldName := 'otk_end';
         DataSet:=OraQuery1;
         FieldKind:=fkDAta;
  end;

      With TFloatField.Create(OraQuery1) do
      begin
          FieldName := 'trudoem';
            DataSet:=OraQuery1;
         FieldKind:=fkDAta;
      end;

      With TFloatField.Create(OraQuery1) do
      begin
            FieldName := 'texkompl_id';
            DataSet:=OraQuery1;
            FieldKind:=fkDAta;
     end;

     With TFloatField.Create(OraQuery1) do
     begin
               FieldName := 'texkompl_texkompl_id';
            DataSet:=OraQuery1;
               FieldKind:=fkDAta;
     end;

     With TFloatField.Create(OraQuery1) do
     begin
            FieldName := 'type_tex';
            DataSet:=OraQuery1;
            FieldKind:=fkDAta;
     end;

     With TFloatField.Create(OraQuery1) do
     begin
              FieldName := 'nar';
            DataSet:=OraQuery1;
            FieldKind:=fkDAta;
    end;

          With TIntegerField.Create(OraQuery1) do
     begin
              FieldName := 'fl_end_trud_beg';
            DataSet:=OraQuery1;
            FieldKind:=fkDAta;
    end;

     With TStringField.Create(MemTableEh1) do
     begin
              FieldName := 'nomer';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
            Size := 50;
     end;
          With TStringField.Create(MemTableEh1) do
     begin
              FieldName := 'doc';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
            Size := 100000;
     end;
          With TStringField.Create(MemTableEh1) do
     begin
              FieldName := 'name';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
            Size := 100;
     end;
          With TStringField.Create(MemTableEh1) do
     begin
              FieldName := 'dep';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
     end;
          With TStringField.Create(MemTableEh1) do
     begin
              FieldName := 'pdate_beg';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
     end;
          With TStringField.Create(MemTableEh1) do
     begin
              FieldName := 'pdate_end';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
     end;
          With TStringField.Create(MemTableEh1) do
     begin
              FieldName := 'otk_end';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
     end;
          With TFloatField.Create(MemTableEh1) do
     begin
              FieldName := 'trudoem';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
    end;
              With TFloatField.Create(MemTableEh1) do
     begin
              FieldName := 'texkompl_id';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
    end;
              With TFloatField.Create(MemTableEh1) do
     begin
              FieldName := 'texkompl_texkompl_id';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
    end;
              With TFloatField.Create(MemTableEh1) do
     begin
              FieldName := 'type_tex';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
    end;

                  With TFloatField.Create(MemTableEh1) do
     begin
              FieldName := 'nar';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
    end;

          With TIntegerField.Create(MemTableEh1) do
     begin
              FieldName := 'fl_end_trud_beg';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
      end;

///////////////////////////**************Конец описанию полей


tx:='Select name from tronix.user_l where name='+#39+OraQuery1.Session.Username+#39+' and  user_gr_user_gr_id=13';
 OraQuery2.SQL.Text:=tx;
OraQuery2.ExecSQL;

if  OraQuery2.RecordCount>0 then
begin
  MEMTableEh1.ReadOnly:=false;
  OraQuery1.ReadOnly:=false;
end;
if  OraQuery2.RecordCount=0 then
begin
    MEMTableEh1.ReadOnly:=true ;
    OraQuery1.ReadOnly:=true;
end;
 OraQuery2.Close;
// button2.Enabled:=false;
if Form9.Combobox1.text='Деревом' then
begin
tx:='  Select * from ( ';
tx:=tx+' Select  tx.nomer  ,tx.name, to_char(tx.pdate_beg,''DD.MM.YYYY'') pdate_beg,to_char(tx.pdate_end,''DD.MM.YYYY'') pdate_end,nordsy.SUM_TRUD(tx.texkompl_id) trudoem, tx.texkompl_id, tx.texkompl_texkompl_id,';
tx:=tx+' (Select nomer from nordsy.dep where dep_id=tx.dep_dep_id) dep,';
tx:=tx+' tx.type_tex_type_tex_id type_tex,to_char(tx.otk_end,''DD.MM.YYYY'') otk_end ,NORDSY.GET_CHERTEZH(tx.texkompl_id) doc, to_number(NORDSY.SUM_TRUD_PROF_TEXKOMPL(tx.texkompl_id,0)) nar, ';    //   NORDSY.SUM_TRUD_PROF_TEXKOMPL('+DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+',230)
tx:=tx+'  tx.fl_end_trud fl_end_trud_beg ';
tx:=tx+' from tx_texkompl tx';
tx:=tx+' connect by prior tx.texkompl_id = tx.texkompl_texkompl_ID';
tx:=tx+' start	with  tx.texkompl_ID in (Select texkompl_id from tx_texkompl';
tx:=tx+' where texkompl_texkompl_id is null';
tx:=tx+' and  project_project_id='+Edit1.text;
tx:=tx+' )) ';
//where type_tex<>12';
//tx:=tx+' and nsort=1)) where type_tex<>12';
//tx:=tx+' order by nomer';
end;

if  Form9.Combobox1.text='Списком' then
 begin
button2.Enabled:=true;
tx:=' Select tx.texkompl_id,tx.texkompl_texkompl_id, to_char(tx.otk_end,''DD.MM.YYYY'') otk_end, nordsy.SUM_TRUD(tx.texkompl_id) trudoem,';
tx:=tx+' (Select nomer from nordsy.dep where dep_id=tx.dep_dep_id) dep,';
tx:=tx+' tx.trudoem,tx.nomer,';
tx:=tx+' to_char(tx.pdate_beg,''DD.MM.YYYY'') pdate_beg,to_char(tx.pdate_end,''DD.MM.YYYY'') pdate_end,';
tx:=tx+' tx.name, NORDSY.GET_CHERTEZH(tx.texkompl_id) doc, tx.type_tex_type_tex_id type_tex , to_number(NORDSY.SUM_TRUD_PROF_TEXKOMPL(tx.texkompl_id,0)) nar, ';
tx:=tx+'  tx.fl_end_trud fl_end_trud_beg ';
tx:=tx+'   from tx_texkompl tx ';
tx:=tx+'where tx.type_tex_type_tex_id in (7,12) ';
tx:=tx+'and tx.project_project_id='+Edit1.text;
tx:=tx+' order by nomer';

 end;


if  Form9.Combobox1.text='Списком с планируемым исполнителем' then
 begin
       With TStringField.Create(OraQuery1) do
   begin
         FieldName := 'NAME_firm_plan';
         DataSet:=OraQuery1;
         FieldKind:=fkDAta;
  end;

            With TStringField.Create(MemTableEh1) do
     begin
              FieldName := 'NAME_firm_plan';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
     end;

DBGridEh1.Columns.Add;
DBGridEh1.Columns[9].FieldName:='NAME_firm_plan';
DBGridEh1.Columns[9].ButtonStyle:=cbsNone;
DBGridEh1.Columns[9].STFilter.Visible := False;
DBGridEh1.Columns[9].Title.Caption :='Планируемый выполнитель';

button2.Enabled:=false;

tx:=' Select tx.texkompl_id,tx.texkompl_texkompl_id, to_char(tx.otk_end,''DD.MM.YYYY'') otk_end, nordsy.SUM_TRUD(tx.texkompl_id) trudoem,';
tx:=tx+' (Select nomer from nordsy.dep where dep_id=tx.dep_dep_id) dep,';
tx:=tx+' tx.trudoem,tx.nomer nomer, Decode((Select name from tronix.firm where firm_id=(Select firm_firm_id from tronix.t1000r where texkompl_texkompl_id=tx.texkompl_id)),null,';
tx:=tx+'(Select Nomer from Nordsy.DEP where type_dep_type_dep_id=2 and DEP_id=(Select firm_firm_id from tronix.t1000r where texkompl_texkompl_id=tx.texkompl_id)),';
tx:=tx+'(Select IDENT from tronix.firm where firm_id=(Select firm_firm_id from tronix.t1000r where texkompl_texkompl_id=tx.texkompl_id)))  NAME_firm_plan, ';
tx:=tx+' to_char(tx.pdate_beg,''DD.MM.YYYY'') pdate_beg,to_char(tx.pdate_end,''DD.MM.YYYY'') pdate_end,';
tx:=tx+' tx.name, NORDSY.GET_CHERTEZH(tx.texkompl_id) doc, tx.type_tex_type_tex_id type_tex , nordsy.summ_nar_tx(tx.texkompl_id,project_project_id) nar ';
tx:=tx+'   from tx_texkompl tx ';
tx:=tx+'where tx.type_tex_type_tex_id in (7,12) ';
tx:=tx+'and tx.project_project_id='+Edit1.text;
tx:=tx+' order by nomer';

 end;
  OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;


MemTableEh1.TreeList.Active := True;
//DbgridEh1.DataSource.DataSet.

  MemTableEh1.Open;
 DBGridEh1.Columns[3].STFilter.ExpressionStr:='';
 DBGridEh1ApplyFilter(nil);
end;

procedure TForm36.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if form39.Showing=true then
   form39.Close;
   OraQuery1.Close;

  OraQuery2.Close;
  OraQuery3.Close;
    OraQuery4.Close;
  MonthCalendar1.Visible:=false;
   DBGridEh1.DataSource.DataSet:=nil;
MemTableEh1.Close;
DBGridEh1.DataSource.DataSet:=MemTableEh1;
   OraQuery1.Fields.Clear; ///Убрать
  MemTableEh1.Fields.Clear;

 if  Form9.Combobox1.text='Списком с планируемым исполнителем' then
      DBGridEh1.Columns[9].Destroy;

end;

type
  TCrackCustomGridEh=class(TDBGridEh);

procedure TForm36.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
 ARect  : TRect;
 AText  : string;
 RowNumber, NewHeight : integer;
 wTxt : integer;
 wRect: integer;
 nLine: integer;

begin

 AText :=Column.Field.AsString;
 wTxt :=DBGridEh1.Canvas.TextWidth(AText);
 wRect:=(Rect.Right-Rect.Left)-2;
 nLine:=Trunc(wTxt/wRect)+1;

 if nLine > 1 then
   begin
     RowNumber:=DBGridEh1.DataSource.DataSet.RecNo;
     NewHeight:= nLine*TCrackCustomGridEh(Sender).DefaultRowHeight + 7;
     if NewHeight > TCrackCustomGridEh(Sender).RowHeights[RowNumber] then
       begin
         TCrackCustomGridEh(Sender).RowHeights[RowNumber] := NewHeight;
       end;

     ARect:=Rect;
     ARect.Bottom:=ARect.Top+TCrackCustomGridEh(Sender).RowHeights[RowNumber];

     WriteTextEH(DBGridEh1.Canvas,   // Canvas
                ARect , // Draw rect and ClippingRect
                True ,  // Fill rect Canvas.Brash.Color
                1, 1,   // dX,dY InflateRect(Rect, -DX, -DY) for text
                AText,
                taLeftJustify,// Text alignment
                tlTop ,  // Text layout
                True  ,  // Word break
                False ,  // Truncate long text by ellipsis
                0,       // Left margin
                0,       // Right margin
                False);
   end;
   end;



procedure TForm36.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
   if (Column.Field.DataSet.FieldByName('nar').AsFloat=Column.Field.DataSet.FieldByName('trudoem').AsFloat) and
   (Column.Field.DataSet.FieldByName('fl_end_trud_beg').AsInteger<>0) and (Column.Field.DataSet.FieldByName('type_tex').asString<>'11') then
  begin
      Background := clTeal;
  end;
  
  if Column.Field.DataSet.FieldByName('otk_end').AsString <>'' then
  begin
      Background := clGreen;
  end;


end;


procedure TForm36.Button1Click(Sender: TObject);
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
//  SaveDBGridEhToExportFile(TDBGridEhExportAsHTML,DBGridEh1,'c:\file1.htm',true);
  end;
end;


end;

procedure TForm36.DBGridEh1DblClick(Sender: TObject);
var tx:string;
begin
 MonthCalendar1.Visible:=false;
///*** Проставляем планируемого исполнителя
if DbgridEH1.SelectedField.FieldName  ='NAME_firm_plan' then begin
  tx:='';
  tx:=tx+'  Select nomer ';
  tx:=tx+' from ( ';
  tx:=tx+' Select nomer ';
  tx:=tx+' from nordsy.dep ';
  tx:=tx+' connect by prior dep_id=dep_dep_id ';
  tx:=tx+' start with dep_id in ( ';
  tx:=tx+' Select  tdg.dep_dep_id from tronix.user_l ul, tronix.user_gr ugr,tronix.dep_gr tdg ';
  tx:=tx+' where ul.name=user ';
  tx:=tx+' and ul.user_gr_user_gr_id=ugr.user_gr_id ';
  tx:=tx+' and tdg.user_gr_user_gr_id=ugr.user_gr_id ';
  tx:=tx+' and ugr. type_gr_type_gr_id=12 ';
  tx:=tx+' and (Select type_dep_type_dep_id from nordsy.dep where dep_id=tdg.dep_dep_id)=2 ';
 tx:=tx+' union all ';
 tx:=tx+' Select tdg.dep_dep_id ';
  tx:=tx+'  from tronix.user_l ul, tronix.user_gr ugr,tronix.dep_gr tdg ';
  tx:=tx+' where ul.name=user ';
  tx:=tx+' and ul.user_gr_user_gr_id=ugr.user_gr_id ';
  tx:=tx+' and ugr. type_gr_type_gr_id=11 ';
  tx:=tx+' and (Select type_dep_type_dep_id from nordsy.dep where dep_id=tdg.dep_dep_id)=2) ';
  tx:=tx+' ) ';
  tx:=tx+' where nomer='+#39+MEMTABLEEH1.FieldByName('dep').AsString+#39;
  OraQuery2.SQL.Text:=tx;
  OraQuery2.ExecSQL;     
   if OraQuery2.RecordCount>0 then
     begin
      Form41.isp_plan_was:= MEMTABLEEH1.FieldByName('NAME_firm_plan').AsString ;
      Form41.ShowModal();
      end;
   OraQuery2.Close;
end;
//////////////////************ Проставили исполнителя

if DbgridEH1.SelectedField.FieldName  ='doc' then begin

tx:='';
//if Form27.CheckBox2.Checked=true then
tx:=' Select name,tronix.sp_name(sprav_id)sprname,sprkod, potr,zavod,cex, vidano,nomer_tk,spavname,up_texkompl_id, TTN_NUM,sprav_id from (';

tx:=tx+' Select name,sprname,sprkod, potr,zavod,cex, vidano,nomer_tk,spavname,up_texkompl_id, TTN_NUM,sprav_id from';
tx:=tx+' (Select name,sprname,sprkod,nvl(round(sum(suma_potr),4),0) potr,round(sum(suma_zavod),4) zavod,round(sum(suma_vcexe),4) cex,nvl(round(summ_vidano,4),0) vidano,nomer_tk,spavname,up_texkompl_id, TTN_NUM,sprav_id ';
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
tx:=tx+' nordsy.get_TTN(potr.sprav_sprav_id,'+Edit1.text+',''ALL'') TTN_NUM ';
tx:=tx+' from tx_car_potr potr, tronix.sprav spr , tronix.sp sp, tronix.document do ';
tx:=tx+' where spr.sprav_id=potr.sprav_sprav_id ';

tx:=tx+' and  spr.can_do_self =1 ';
tx:=tx+'  and sp.nn(+)= potr.sp_id_from ';
tx:=tx+'  and sp.nnn=do.document_id(+) ';
tx:=tx+' and potr.texkompl_texkompl_id = '+MEMTABLEEH1.FieldByName('texkompl_id').AsString ;
tx:=tx+' ) ';
tx:=tx+' group by nomer_tk,name, spkod,spr_id,sprname,sprkod,spavname,summ_vidano,up_texkompl_id,TTN_NUM,sprav_id ';
tx:=tx+' order by name ))';
//if Form27.CheckBox2.Checked=true then
//tx:=tx+' where  (potr-zavod)>0) where (potr-vidano)>0 ';
  //  ShowMessage(Edit1.text);
  form33.Caption:=' МСЧ по '+MEMTABLEEH1.FieldByName('nomer').AsString;
  form33.OraQuery1.SQL.Text:=tx;
     form33.ShowModal();


  end;


   if MEMTableEh1.ReadOnly=false then
      begin
    if ((Sender as TDBGridEH).SelectedField.FieldName = 'pdate_beg') then
       with MonthCalendar1 do
       begin

        Left := (Sender as TDBGridEH).CellRect(6,DBGridEH1.Row).Right + (Sender as TDBGridEH).Left + 1;
    Top := (Sender as TDBGridEH).CellRect(6,DBGridEH1.Row).Top + (Sender as TDBGridEH).Top + 1;
      Width := (Sender as TDBGridEH).CellRect(6,DBGridEH1.Row).Right - (Sender as TDBGridEH).CellRect(6,DBGridEH1.Row).Left + 2;
    Width := (Sender as TDBGridEH).CellRect(6,DBGridEH1.Row).Right - (Sender as TDBGridEH).CellRect(6,DBGridEH1.Row).Left + 2;
   Height := (Sender as TDBGridEH).CellRect(6,DBGridEH1.Row).Bottom - (Sender as TDBGridEH).CellRect(6,DBGridEH1.Row).Top + 2;
            if  MEMTABLEEH1.FieldByName('pdate_beg').AsString <>''
              then  date:= MEMTABLEEH1.FieldByName('pdate_beg').AsDateTime
       else date:= now();
       Visible := True;
       end;

    if ((Sender as TDBGridEH).SelectedField.FieldName = 'pdate_end') then
       with MonthCalendar1 do
       begin

        Left := (Sender as TDBGridEH).CellRect(7,DBGridEH1.Row).Right + (Sender as TDBGridEH).Left + 1;
    Top := (Sender as TDBGridEH).CellRect(7,DBGridEH1.Row).Top + (Sender as TDBGridEH).Top + 1;
      Width := (Sender as TDBGridEH).CellRect(7,DBGridEH1.Row).Right - (Sender as TDBGridEH).CellRect(7,DBGridEH1.Row).Left + 2;
    Width := (Sender as TDBGridEH).CellRect(7,DBGridEH1.Row).Right - (Sender as TDBGridEH).CellRect(7,DBGridEH1.Row).Left + 2;
   Height := (Sender as TDBGridEH).CellRect(7,DBGridEH1.Row).Bottom - (Sender as TDBGridEH).CellRect(7,DBGridEH1.Row).Top + 2;
            if  MEMTABLEEH1.FieldByName('pdate_end').AsString <>''
              then  date:= MEMTABLEEH1.FieldByName('pdate_end').AsDateTime
       else date:= now();
       Visible := True;
       end;
  end;
  if ((Sender as TDBGridEH).SelectedField.FieldName = 'nomer') then    begin
  Form39.Caption:=DBGrideh1.DataSource.DataSet.FieldByName('nomer').AsString;
  Form39.tk_poz:=1;
  Form39.Show();
  end;

  if (Sender as TDBGridEH).SelectedField.FieldName  ='trudoem' then begin
     Form48.Caption:=' Наряды по '+  DBGrideh1.DataSource.DataSet.FieldByName('nomer').AsString;
     Form48.tex:= DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString;
     Form48.ShowmODAL;
    //ShowMessage('!!!');

  end;
end;

procedure TForm36.DBGridEh1ColExit(Sender: TObject);
begin
    MonthCalendar1.Visible:= False;
end;

procedure TForm36.MonthCalendar1DblClick(Sender: TObject);
begin
 if DateToStr(MonthCalendar1.Date)<>MEMTABLEEH1.FieldByName(DBGridEH1.SelectedField.FieldName).AsString then
begin

  DBGridEH1.DataSource.DataSet.edit;
  DBGridEH1.datasource.DataSet.FieldByName(DBGridEH1.SelectedField.FieldName).AsDateTime := MonthCalendar1.Date;
    dbgridEH1.DataSource.DataSet.Post;

end;
  MonthCalendar1.Visible:=false;
end;


procedure TForm36.OraQuery1AfterPost(DataSet: TDataSet);
begin

if (DBGridEH1.SelectedField.FieldName = 'pdate_beg') or (DBGridEH1.SelectedField.FieldName = 'pdate_end')then
begin
  MonthCalendar1.Visible:=false;
OraQuery3.SQL.Text:='Update  tx_texkompl tx Set tx.'+DBGridEH1.SelectedField.FieldName+'=to_date('+#39+DataSet.FieldByName(DBGridEH1.SelectedField.FieldName).AsString+#39+',''DD.MM.YYYY'') where tx.texkompl_id='+
DataSet.FieldByName('texkompl_id').AsString;
OraQuery3.ExecSQL;
end;

//***Пишу планового исполнителя
if (DBGridEH1.SelectedField.FieldName = 'NAME_firm_plan') then
   begin
    OraQuery3.SQL.Text:='Select texkompl_texkompl_id, firm_firm_id, user_id,date_ins from tronix.t1000r where texkompl_texkompl_id='+MEMTABLEEH1.FieldByName('texkompl_id').AsString;
  OraQuery3.ExecSQL;
if   OraQuery3.RecordCount>0 then
OraQuery3.SQL.Text:='Update  tronix.t1000r Set firm_firm_id='+Form41.OraQuery1.FieldByName('ID').AsString+','+
'user_id=user, date_ins=sysdate where texkompl_texkompl_id='+ DataSet.FieldByName('texkompl_id').AsString
else
OraQuery3.SQL.Text:='insert into tronix.t1000r(texkompl_texkompl_id,firm_firm_id,user_id,date_ins) values ('
+DataSet.FieldByName('texkompl_id').AsString+','+Form41.OraQuery1.FieldByName('ID').AsString+', user,sysdate)';
OraQuery3.ExecSQL;
   end;

end;

procedure TForm36.DBGridEh1CellClick(Column: TColumnEh);
begin
if    MonthCalendar1.Visible=true then MonthCalendar1.Visible:=false;
end;

procedure TForm36.OraQuery1AfterScroll(DataSet: TDataSet);
begin
  MonthCalendar1.Visible:=false;
end;

procedure TForm36.DBGridEh1ApplyFilter(Sender: TObject);
begin
  DBGridEh1.DataSource.DataSet.Filtered:=false;
  if Copy(DBGridEh1.Columns[3].STFilter.ExpressionStr,1,1)='0' then
    DBGridEh1.DataSource.DataSet.Filter:=DBGridEh1.Columns[3].FieldName+' like '+#39+Copy(DBGridEh1.Columns[3].STFilter.ExpressionStr,2,1)+'%%'#39
    else
  DBGridEh1.DataSource.DataSet.Filter:=DBGridEh1.Columns[3].FieldName+' like '+#39+DBGridEh1.Columns[3].STFilter.ExpressionStr+'%%'#39;

 if  Copy(DBGridEh1.Columns[3].STFilter.ExpressionStr,1,2)='01' then
//    DBGridEh1.DataSource.DataSet.Filter:=DBGridEh1.Columns[3].FieldName+' like '+#39+Copy(DBGridEh1.Columns[3].STFilter.ExpressionStr,2,1)+'%%'#39
SHowMessage(DBGridEh1.DataSource.DataSet.Filter);

  DBGridEh1.DataSource.DataSet.Filtered:=true;
end;

procedure TForm36.Button2Click(Sender: TObject);
var Excel, WorkBook, SheetActive, Sheet : OleVariant;
i,j,dd,q,ii,k,u: integer;
si, last,text, text1, tx,tx1,certez, scbr:string;
buf:array[1..100] of string;
byteArray  : Array of String;
begin
Form37.ShowModal();
if (parametr='В разрезе ПРОФЕССИЙ') or (parametr='Просто журнал со структурой!') then
  begin
MemTableEh1.TreeList.FullExpand();
FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents := False;
DBGrideh1.DataSource.DataSet.DisableControls;
FExcel.Visible:=false;
OraQuery1.First;DBGrideh1.DataSource.DataSet.First;
FExcel.Workbooks.Add(-4167);
FExcel.Workbooks[1].WorkSheets[1].Name:=Caption;
index:=3;
Colum:=FExcel.Workbooks[1].WorkSheets[Caption].Columns;
Colum.Columns[1].ColumnWidth:=20;
Colum.Columns[2].ColumnWidth:=20;
Colum.Columns[3].ColumnWidth:=50;
Colum.Columns[4].ColumnWidth:=20;
Colum.Columns[7].ColumnWidth:=18;
Colum.Columns[8].ColumnWidth:=10;
Colum.Columns[9].ColumnWidth:=10;
Colum.Columns[10].ColumnWidth:=10;
Colum.Columns[11].ColumnWidth:=10; //признак

Sheet:=FExcel.Workbooks[1].WorkSheets[Caption];

Sheet.Cells[1,1]:='                '+Caption+' на '+datetoStr(now());
Sheet.Cells[1,1].Font.Bold := True;
Sheet.Cells[1,1].Font.Size := Sheet.Cells[1,2].Font.Size+5;
Sheet.Cells[2,1]:='ТК';
Sheet.Cells[2,1].Font.Bold := True;
Sheet.Cells[2,1].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,2]:='ПТК';
Sheet.Cells[2,2].Font.Bold := True;
Sheet.Cells[2,2].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,3]:='Наименование';
Sheet.Cells[2,3].Font.Bold := True;
Sheet.Cells[2,3].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,4]:='Чертеж';
Sheet.Cells[2,4].Font.Bold := True;
Sheet.Cells[2,4].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,5]:='Цех';
Sheet.Cells[2,5].Font.Bold := True;
Sheet.Cells[2,5].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,6]:='Трудоемкость';
Sheet.Cells[2,6].Font.Bold := True;
Sheet.Cells[2,6].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,7]:='Закрыто по нарядам';
Sheet.Cells[2,7].Font.Bold := True;
Sheet.Cells[2,7].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,8]:='Начало';
Sheet.Cells[2,8].Font.Bold := True;
Sheet.Cells[2,8].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,9]:='Конец';
Sheet.Cells[2,9].Font.Bold := True;
Sheet.Cells[2,9].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,10]:='ПДО';
Sheet.Cells[2,10].Font.Bold := True;
Sheet.Cells[2,10].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.range[Sheet.cells[2,1],Sheet.cells[2,10]].borders.weight:=3;


While  DBGrideh1.DataSource.DataSet.EOF=false do
  begin
 if DBGrideh1.DataSource.DataSet.FieldByName('type_tex').AsFloat=12 then
  begin
 Sheet.Cells[index,2]:=DBGrideh1.DataSource.DataSet.Fields[0].AsString;
 Sheet.Cells[index,11]:='БK';
 end;

if DBGrideh1.DataSource.DataSet.FieldByName('type_tex').AsFloat<>12 then
begin
 last:=DBGrideh1.DataSource.DataSet.Fields[0].AsString;
 Sheet.Cells[index,11]:='ПТК';
end;

Sheet.Cells[index,1]:=last;

Sheet.Cells[index,3]:=DBGrideh1.DataSource.DataSet.FieldByName('name').AsString;
Sheet.Cells[index,3].WrapText := true;
Sheet.Cells[index,4]:=DBGrideh1.DataSource.DataSet.Fields[1].AsString;
Sheet.Cells[index,4].WrapText := true;
Sheet.Cells[index,5].NumberFormat:= '@';
Sheet.Cells[index,5]:=DBGrideh1.DataSource.DataSet.FieldByName('dep').AsString;
Sheet.Cells[index,6]:=DBGrideh1.DataSource.DataSet.FieldByName('trudoem').AsFloat;
Sheet.Cells[index,7]:=DBGrideh1.DataSource.DataSet.FieldByName('nar').AsFloat;
if DBGrideh1.DataSource.DataSet.FieldByName('pdate_beg').AsString<>'' then
Sheet.Cells[index,8]:=StrToDAte(DBGrideh1.DataSource.DataSet.FieldByName('pdate_beg').AsString);
if DBGrideh1.DataSource.DataSet.FieldByName('pdate_end').AsString<>'' then
Sheet.Cells[index,9]:=StrToDAte(DBGrideh1.DataSource.DataSet.FieldByName('pdate_end').AsString);
if DBGrideh1.DataSource.DataSet.FieldByName('otk_end').AsString<>'' then
Sheet.Cells[index,10]:=StrToDAte(DBGrideh1.DataSource.DataSet.FieldByName('otk_end').AsString);


if  DBGrideh1.DataSource.DataSet.FieldByName('type_tex').AsFloat<>12 then
Sheet.range[Sheet.cells[index,1],Sheet.cells[index,10]].Font.Bold := true;
if  DBGrideh1.DataSource.DataSet.FieldByName('otk_end').AsString<>'' then
Sheet.range[Sheet.cells[index,1],Sheet.cells[index,10]].Interior.ColorIndex :=4;

dd:=1;   inc(index);

//// Подьягиваю список профессий
if parametr='В разрезе ПРОФЕССИЙ' then
  begin
tx:='';
tx:='Select NORDSY.SUM_TRUD_PROF_TEXKOMPL('+DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+',230) as itog from dual';
OraQuery4.SQL.Text:=tx;
OraQuery4.ExecSQL;
text:=OraQuery4.FieldByName('itog').AsString;

   text1:='';
k:=0;
if text='$' then text:='$!!!!!!!!НЕПРИВЯЗАНЫ ПРОФЕССИИ!!!!!!!!!!!!!!!!!!!$0$0$';
//   begin
for ii:=2 to length(text)-1 do
begin
 if (text[ii]<>'$') and (text[ii]<>'')then
    text1:=text1+text[ii]
 else begin
    k:=k+1;
    buf[k]:=text1;
    text1:='';
    next;
 end;end;
 inc(k);
 buf[k]:=text1;
  for u:=1 to round(k/3)  do
     begin
 if DBGrideh1.DataSource.DataSet.FieldByName('type_tex').AsFloat=12 then
   Sheet.Cells[index,2]:=DBGrideh1.DataSource.DataSet.Fields[0].AsString
    else
   last:=DBGrideh1.DataSource.DataSet.Fields[0].AsString;
   Sheet.Cells[index,1]:=last;
   Sheet.Cells[index,3]:=buf[3*(u-1)+1];
   Sheet.Cells[index,3].WrapText := true;
   Sheet.Cells[index,7]:=buf[3*(u-1)+2];
   Sheet.Cells[index,6]:=buf[3*(u-1)+3];
if DBGrideh1.DataSource.DataSet.FieldByName('pdate_beg').AsString<>'' then
Sheet.Cells[index,8]:=StrToDAte(DBGrideh1.DataSource.DataSet.FieldByName('pdate_beg').AsString);
if DBGrideh1.DataSource.DataSet.FieldByName('pdate_end').AsString<>'' then
Sheet.Cells[index,9]:=StrToDAte(DBGrideh1.DataSource.DataSet.FieldByName('pdate_end').AsString);
if DBGrideh1.DataSource.DataSet.FieldByName('otk_end').AsString<>'' then
Sheet.Cells[index,10]:=StrToDAte(DBGrideh1.DataSource.DataSet.FieldByName('otk_end').AsString);
      dd:=dd+1;
     inc(index);
 end;  //end; /// Конец условия проверки наличия должностей
  end; // Конец проверки что идем по условиям
DBGrideh1.DataSource.DataSet.Next;
       end;
 //Если хотим профессии то группируем по ним
 if parametr='В разрезе ПРОФЕССИЙ' then
  begin
  Sheet.range[Sheet.cells[3,1],Sheet.cells[index-1,10]].borders.weight:=2;
///Групиировка (2)
   i := 4;
   While (Sheet.Cells[i, 1].Value <> '') or (Sheet.Cells[i, 2].Value <> '') do begin
   si:=Sheet.Cells[i, 1].Value;
   While (Sheet.Cells[i, 1].Value=si) do begin
      Sheet.Rows[i].Group[2];
   i := i + 1;
   end;
    i := i + 1;
  end;
     i := 4;
   While (Sheet.Cells[i, 1].Value <> '')  do begin
   si:=Sheet.Cells[i, 2].Value;  i := i + 1;
   While (Sheet.Cells[i, 2].Value=si) and (si<>'')do begin
      Sheet.Rows[i].Group[3];
       i := i + 1;
   end;
  end;

  Sheet.Outline.SummaryRow:=xlSummaryAbove;
 Sheet.Outline.ShowLevels[1];
  end; // КонецУсловия что надо группировать по профессиям
 FExcel.Visible:=true;
 DBGrideh1.DataSource.DataSet.EnableControls;
  end; /////////////Конец В разрезе ПРОФЕССИЙ////////////////
   if parametr='Ведомость комплектации' then
  begin
  // ShowMessage(DBGrideh1.DataSource.DataSet.FieldByName('nomer').asString);
 FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents := False;
FExcel.Visible:=false;
FExcel.Workbooks.Add(-4167);
FExcel.Workbooks[1].WorkSheets[1].Name:='1';


OraQuery4.SQL.Text:='Select tx.nomer as nomer_full, SUBSTR(tx.nomer,INSTR(tx.nomer,''-'')+1) nomer, Texkompl_id  from tx_texkompl tx where texkompl_texkompl_id='+
DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').asString+' order by nomer';
OraQuery4.ExecSQL;
Colum:=FExcel.Workbooks[1].WorkSheets['1'].Columns;
Colum.Columns[1].ColumnWidth:=10;
Colum.Columns[2].ColumnWidth:=50;
Colum.Columns[3].ColumnWidth:=10;
Colum.Columns[4].ColumnWidth:=20;
Colum.Columns[5].ColumnWidth:=20;
FExcel.Workbooks[1].WorkSheets['1'].Rows[2].RowHeight:=20;


OraQuery4.First;
 SetLength(byteArray,OraQuery4.RecordCount+1);
While OraQuery4.Eof=false do
 begin
Colum.Columns[5+OraQuery4.RecNo].ColumnWidth:=20;

OraQuery4.Next;
end;   OraQuery4.First;

Sheet:=FExcel.Workbooks[1].WorkSheets['1'];
Sheet.Cells[1,1]:='                Ведомость комплектации по '+DBGrideh1.DataSource.DataSet.FieldByName('nomer').asString;
Sheet.Cells[1,1].Font.Bold := True;
Sheet.Cells[1,1].Font.Size := Sheet.Cells[1,2].Font.Size+5;
Sheet.Cells[1,1].Font.name:='Arrial Cyr';

While OraQuery4.Eof=false do
 begin
byteArray[OraQuery4.RecNo]:= OraQuery4.FieldByName('nomer_full').asString;
OraQuery4.Next;
end;

//Sheet.range[Sheet.cells[2,1],Sheet.cells[2,5+OraQuery4.RecordCount]].borders.weight:=3;
//Sheet.range[Sheet.cells[2,1],Sheet.cells[2,5+OraQuery4.RecordCount]].VerticalAlignment := xlCenter;
//Sheet.range[Sheet.cells[2,1],Sheet.cells[2,5+OraQuery4.RecordCount]].HorizontalAlignment := xlCenter;

tx1:=' Select poz,nn,name, kol,doc,g, ';
tx1:=tx1+' (Select nomer from tx_texkompl where texkompl_id=tx1) nom1, ';
tx1:=tx1+' (Select nomer from tx_texkompl where texkompl_id=tx2) nom2, ';
tx1:=tx1+' (Select nomer from tx_texkompl where texkompl_id=tx3) nom3, ';
tx1:=tx1+' (Select nomer from tx_texkompl where texkompl_id=tx4) nom4, ';
tx1:=tx1+' (Select nomer from tx_texkompl where texkompl_id=tx5) nom5, ';
tx1:=tx1+' (Select nomer from tx_texkompl where texkompl_id=tx6) nom6, ';
tx1:=tx1+' (Select nomer from tx_texkompl where texkompl_id=tx7) nom7, ';
tx1:=tx1+' Decode((Select texkompl_texkompl_id from tx_texkompl where texkompl_id=tx1),'+DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').asString+',null, (Select nomer from nordsy.dep where dep_id=(Select dep_dep_id from tx_texkompl where texkompl_id=tx1))) dep1, ';
tx1:=tx1+' Decode((Select texkompl_texkompl_id from tx_texkompl where texkompl_id=tx2),'+DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').asString+',null, (Select nomer from nordsy.dep where dep_id=(Select dep_dep_id from tx_texkompl where texkompl_id=tx2))) dep2, ';
tx1:=tx1+' Decode((Select texkompl_texkompl_id from tx_texkompl where texkompl_id=tx3),'+DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').asString+',null, (Select nomer from nordsy.dep where dep_id=(Select dep_dep_id from tx_texkompl where texkompl_id=tx3))) dep3, ';
tx1:=tx1+' Decode((Select texkompl_texkompl_id from tx_texkompl where texkompl_id=tx4),'+DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').asString+',null, (Select nomer from nordsy.dep where dep_id=(Select dep_dep_id from tx_texkompl where texkompl_id=tx4))) dep4, ';
tx1:=tx1+' Decode((Select texkompl_texkompl_id from tx_texkompl where texkompl_id=tx5),'+DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').asString+',null, (Select nomer from nordsy.dep where dep_id=(Select dep_dep_id from tx_texkompl where texkompl_id=tx5))) dep5, ';
tx1:=tx1+' Decode((Select texkompl_texkompl_id from tx_texkompl where texkompl_id=tx6),'+DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').asString+',null, (Select nomer from nordsy.dep where dep_id=(Select dep_dep_id from tx_texkompl where texkompl_id=tx6))) dep6, ';
tx1:=tx1+' Decode((Select texkompl_texkompl_id from tx_texkompl where texkompl_id=tx7),'+DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').asString+',null, (Select nomer from nordsy.dep where dep_id=(Select dep_dep_id from tx_texkompl where texkompl_id=tx7))) dep7 ';
tx1:=tx1+' from ( ';
tx1:=tx1+' Select poz||'' ''||podpoz as poz,nn,name, kol,poz as poz1,(Select ident from tronix.document where document_id=nnn) as doc, ';
tx1:=tx1+' TX_GET_TX_MARSH(''1'',TX_LOAD_MARSH(nn)) tx1, ';
tx1:=tx1+' TX_GET_TX_MARSH(''2'',TX_LOAD_MARSH(nn)) tx2, ';
tx1:=tx1+' TX_GET_TX_MARSH(''3'',TX_LOAD_MARSH(nn)) tx3, ';
tx1:=tx1+' TX_GET_TX_MARSH(''4'',TX_LOAD_MARSH(nn)) tx4, ';
tx1:=tx1+' TX_GET_TX_MARSH(''5'',TX_LOAD_MARSH(nn)) tx5, ';
tx1:=tx1+' TX_GET_TX_MARSH(''6'',TX_LOAD_MARSH(nn)) tx6, ';
tx1:=tx1+' TX_GET_TX_MARSH(''7'',TX_LOAD_MARSH(nn)) tx7, ';
tx1:=tx1+'  SUBSTR(nordsy.load_marsh_ALL( nn,''ППУЕ'',''ПУЕ'',null),1,1)   g ';
tx1:=tx1+'   from tronix.sp ';
tx1:=tx1+'  where nn in ';
tx1:=tx1+'  ( ';
tx1:=tx1+'  Select nn from  ( ';
tx1:=tx1+'  Select  nn,type_str  from tronix.sp ';
tx1:=tx1+'  connect by prior nn=up_nn ';
tx1:=tx1+'  start with nn in ';
tx1:=tx1+'  ( ';
tx1:=tx1+'  Select nn   from tronix.sp ';
tx1:=tx1+'  where nn in ';
tx1:=tx1+'  ( ';
tx1:=tx1+'  Select sp_sp_id from nordsy.tx_mat ';
tx1:=tx1+'  where ';
tx1:=tx1+'  tex_texkompl_id in ';
tx1:=tx1+'  (Select texkompl_id from tx_texkompl ';
tx1:=tx1+'  connect by prior texkompl_id=texkompl_texkompl_id ';
tx1:=tx1+'  start with texkompl_id='+DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').asString+') ';
tx1:=tx1+'  ) ';
tx1:=tx1+'  and  type_str=1) ';
tx1:=tx1+'  ) ';
tx1:=tx1+'  where  type_str  is null ';
tx1:=tx1+'  union all ';
tx1:=tx1+'  Select  nn  from tronix.sp ';
tx1:=tx1+'  where nn in ';
tx1:=tx1+'  ( ';
tx1:=tx1+'  Select sp_sp_id from nordsy.tx_mat ';
tx1:=tx1+'  where ';
tx1:=tx1+'  tex_texkompl_id in ';
tx1:=tx1+'  (Select texkompl_id from tx_texkompl ';
tx1:=tx1+'  connect by prior texkompl_id=texkompl_texkompl_id ';
tx1:=tx1+'  start with texkompl_id='+DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').asString+') ';
tx1:=tx1+'  ) ';
tx1:=tx1+'  and  type_str is null ';
tx1:=tx1+' ) ';
tx1:=tx1+' order by doc,decode(translate(poz1, ''_0123456789'', ''_''), null, to_number(poz1)), poz1  ) ';

 OraQuery4.SQL.Text:=tx1;
OraQuery4.ExecSQL;

OraQuery4.first;
index:=3;
//certez:= OraQuery4.FieldByName('doc').asString;
While OraQuery4.Eof=false do
 begin

if  certez<>OraQuery4.FieldByName('doc').asString then
  begin
 index:=index+1;
 certez:=OraQuery4.FieldByName('doc').asString;
  Sheet.Cells[index,1]:='Чертеж: '+OraQuery4.FieldByName('doc').asString;
  Sheet.Cells[index,1].Font.Bold := True;
  Sheet.Cells[index,1].Font.Size := 14;
 Sheet.Cells[Index,1].Font.name:='Arrial Cyr';
 index:=index+1;

 Sheet.Cells[index,1]:='Позиция';
Sheet.Cells[index,1].Font.Bold := True;
Sheet.Cells[index,1].Font.Size := 14;
Sheet.Cells[index,2]:='Наименование';
Sheet.Cells[index,2].Font.Bold := True;
Sheet.Cells[index,2].Font.Size := 14;
Sheet.Cells[index,3]:='Кол';
Sheet.Cells[index,3].Font.Bold := True;
Sheet.Cells[index,3].Font.Size := 14;
Sheet.Cells[index,4]:='Потребитель';
Sheet.Cells[index,4].Font.Bold := True;
Sheet.Cells[index,4].Font.Size := 14;
Sheet.Cells[index,5]:='№ ПУЕ (потребителя)';
Sheet.Cells[index,5].Font.Bold := True;
Sheet.Cells[index,5].Font.Size := 14;


 for i := 1 to High(byteArray) do
 begin
        Sheet.Cells[index,i+5]:=byteArray[i];
        Sheet.Cells[index,i+5].Font.Bold := True;
        Sheet.Cells[index,i+5].Font.Size := 14;
end;
Sheet.range[Sheet.cells[Index,1],Sheet.cells[index,5+High(byteArray)]].Font.Size:=14;
Sheet.range[Sheet.cells[Index,1],Sheet.cells[index,5+High(byteArray)]].Font.name:='Arrial Cyr';
 Sheet.range[Sheet.cells[index,1],Sheet.cells[index,5+High(byteArray)]].borders.weight:=3;
Sheet.range[Sheet.cells[index,1],Sheet.cells[index,5+High(byteArray)]].VerticalAlignment := xlCenter;
Sheet.range[Sheet.cells[index,1],Sheet.cells[index,5+High(byteArray)]].HorizontalAlignment := xlCenter;
  index:=index+1;
  end; //certez
//**********************************************
//**********************************************
//**********************************************
//**********************************************

//Sheet.Cells[index,1]:=OraQuery4.FieldByName('doc').asString;
//Sheet.Cells[index,1].WrapText := true;
Sheet.Cells[index,1]:=OraQuery4.FieldByName('poz').asString;
Sheet.Cells[index,1].WrapText := true;
Sheet.Cells[index,2]:=OraQuery4.FieldByName('name').asString;
Sheet.Cells[index,2].WrapText := true;
Sheet.Cells[index,3]:=OraQuery4.FieldByName('kol').asString;
Sheet.Cells[index,3].WrapText := true;
 FExcel.Workbooks[1].WorkSheets['1'].Rows[index].RowHeight:=20;

Sheet.Cells[index,5].NumberFormat:= '@';
Sheet.Cells[index,4].NumberFormat:= '@';
 if OraQuery4.FieldByName('dep1').asString  <> '' then
  begin
    Sheet.Cells[index,5]:=OraQuery4.FieldByName('nom1').asString;
    Sheet.Cells[index,4]:=OraQuery4.FieldByName('dep1').asString;
  end
   else
     if OraQuery4.FieldByName('dep2').asString  <> '' then
  begin
    Sheet.Cells[index,5]:=OraQuery4.FieldByName('nom2').asString;
    Sheet.Cells[index,4]:=OraQuery4.FieldByName('dep2').asString;
      end
   else
     if OraQuery4.FieldByName('dep3').asString  <> '' then
  begin
    Sheet.Cells[index,5]:=OraQuery4.FieldByName('nom3').asString;
    Sheet.Cells[index,4]:=OraQuery4.FieldByName('dep3').asString;
      end
   else
     if OraQuery4.FieldByName('dep4').asString  <> '' then
  begin
    Sheet.Cells[index,5]:=OraQuery4.FieldByName('nom4').asString;
    Sheet.Cells[index,4]:=OraQuery4.FieldByName('dep4').asString;
      end
   else
     if OraQuery4.FieldByName('dep5').asString  <> '' then
  begin
    Sheet.Cells[index,5]:=OraQuery4.FieldByName('nom5').asString;
    Sheet.Cells[index,4]:=OraQuery4.FieldByName('dep5').asString;
      end
   else
     if OraQuery4.FieldByName('dep6').asString  <> '' then
  begin
    Sheet.Cells[index,5]:=OraQuery4.FieldByName('nom6').asString;
    Sheet.Cells[index,4]:=OraQuery4.FieldByName('dep6').asString;
      end
   else
     if OraQuery4.FieldByName('dep7').asString  <> '' then
  begin
    Sheet.Cells[index,5]:=OraQuery4.FieldByName('nom7').asString;
    Sheet.Cells[index,4]:=OraQuery4.FieldByName('dep7').asString;
end;

///Вытаскиваю потребителя ЦЕХ потребитель
//if  OraQuery4.FieldByName('nom7').asString <> '' then
//   Sheet.Cells[index,4]:=' '+OraQuery4.FieldByName('dep7').asString
//  else
//  if  OraQuery4.FieldByName('nom6').asString <> '' then
//   Sheet.Cells[index,4]:=' '+OraQuery4.FieldByName('dep6').asString
//  else
//  if  OraQuery4.FieldByName('nom5').asString <> '' then
//   Sheet.Cells[index,4]:=' '+OraQuery4.FieldByName('dep5').asString
//  else
//if  OraQuery4.FieldByName('nom4').asString <> '' then
//   Sheet.Cells[index,4]:=' '+OraQuery4.FieldByName('dep4').asString
//  else
// if  OraQuery4.FieldByName('nom3').asString <> '' then
//   Sheet.Cells[index,4]:=' '+OraQuery4.FieldByName('dep3').asString
//  else
// if  OraQuery4.FieldByName('nom2').asString <> '' then
//   Sheet.Cells[index,4]:=' '+OraQuery4.FieldByName('dep2').asString
//  else
//  if  OraQuery4.FieldByName('nom1').asString <> '' then
//   Sheet.Cells[index,4]:=' '+OraQuery4.FieldByName('dep1').asString;
////Вытащил
///    Раставляю плюсики
  for i := 1 to High(byteArray) do
 begin
 if byteArray[i]=OraQuery4.FieldByName('nom1').asString then  Sheet.Cells[index,i+5]:='+(1)';
  if byteArray[i]=OraQuery4.FieldByName('nom2').asString then  Sheet.Cells[index,i+5]:='+(2)';
   if byteArray[i]=OraQuery4.FieldByName('nom3').asString then  Sheet.Cells[index,i+5]:='+(3)';
    if byteArray[i]=OraQuery4.FieldByName('nom4').asString then  Sheet.Cells[index,i+5]:='+(4)';
     if byteArray[i]=OraQuery4.FieldByName('nom5').asString then  Sheet.Cells[index,i+5]:='+(5)';
      if byteArray[i]=OraQuery4.FieldByName('nom6').asString then  Sheet.Cells[index,i+5]:='+(6)';
       if byteArray[i]=OraQuery4.FieldByName('nom7').asString then  Sheet.Cells[index,i+5]:='+(7)';

  end;
//////////////////////
if   OraQuery4.FieldByName('g').asString ='3' then  Sheet.Cells[index,5+High(byteArray)+1]:=' Порядок неустановлен!!!!';

Sheet.range[Sheet.cells[Index,1],Sheet.cells[index,5+High(byteArray)]].borders.weight:=2;
Sheet.range[Sheet.cells[Index,1],Sheet.cells[index,5+High(byteArray)]].VerticalAlignment := xlCenter;
Sheet.range[Sheet.cells[Index,1],Sheet.cells[index,5+High(byteArray)]].HorizontalAlignment := xlCenter;
Sheet.range[Sheet.cells[Index,1],Sheet.cells[index,5+High(byteArray)]].Font.Size:=14;
Sheet.range[Sheet.cells[Index,1],Sheet.cells[index,5+High(byteArray)]].Font.name:='Arrial Cyr';
Sheet.range[Sheet.cells[Index,1],Sheet.cells[index,5+High(byteArray)]].Font.Bold:=false;
OraQuery4.Next;//OraQuery4.Close;
inc(index);
end;


FExcel.Visible:=true;

   end; /////////////Ведомость комплектации'

   /////////////////////////////Ведомость комплектации 10 цех

   ///////////////////////////////Ведомость комплектации 10 цех
if (parametr='Форма  удостоверения на приёмку ОТК') then
  begin
  if DBGrideh1.DataSource.DataSet.FieldByName('type_tex').asString='11' then
    begin


tx1:='         Select scbp,(Select nomer from tx_texkompl where texkompl_id=tex_tex_id) nomer1, (Select name from tx_texkompl where texkompl_id=tex_tex_id) name1, ';
tx1:=tx1+'         texkompl_texkompl_id, nomer,name ';
tx1:=tx1+'           from  ';
tx1:=tx1+'             ( ';
tx1:=tx1+'          Select tex_tex_id, ';
tx1:=tx1+'          SUBSTR(max(sys_connect_by_path(ident, '', '' )),3) scbp ';
tx1:=tx1+'            from ';
tx1:=tx1+'          (Select tex_tex_id, ';
tx1:=tx1+'            ident, ';
tx1:=tx1+'             row_number() over (partition by tex_tex_id order by ident) rn ';
tx1:=tx1+'             from ';
tx1:=tx1+'                 ( ';
tx1:=tx1+'              Select Distinct(tex_tex_id), (Select ident from tronix.document where document_id=nnn) as ident ';
tx1:=tx1+'            from ';
tx1:=tx1+'            ( ';
tx1:=tx1+'             Select tex_tex_id,(Select nnn from tronix.sp where nn=tx_mat.sp_sp_id)  nnn ';
tx1:=tx1+'          from ';
tx1:=tx1+'        (Select nomer, name, texkompl_id,Nordsy.get_up_ttn(texkompl_id,7) as tex_tex_id,type_tex_type_tex_id  from tx_texkompl ';
tx1:=tx1+'        connect by prior texkompl_id=texkompl_texkompl_id ';
tx1:=tx1+'        start with texkompl_id='+DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').asString+') ';
tx1:=tx1+'        , ';
tx1:=tx1+'         (Select sp_sp_id,tex_texkompl_id from nordsy.tx_mat) tx_mat ';
tx1:=tx1+'       where tx_mat.tex_texkompl_id= texkompl_id ';
tx1:=tx1+'          ) ';
tx1:=tx1+'                   ) ) ';
tx1:=tx1+'       start with rn=1 ';
tx1:=tx1+'       connect by prior rn=rn-1 ';
tx1:=tx1+'       and prior tex_tex_id =tex_tex_id ';
tx1:=tx1+'       group by tex_tex_id ';
tx1:=tx1+'       order by tex_tex_id ';
tx1:=tx1+'       ), ';
tx1:=tx1+'       tx_texkompl ';
tx1:=tx1+'       where texkompl_texkompl_id=tex_tex_id ';
tx1:=tx1+'       order by nomer1, nomer ';

   OraQuery4.SQL.Text:=tx1;
 OraQuery4.ExecSQL;
OraQuery4.first;
  FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents := False;
FExcel.Visible:=false;
FExcel.Workbooks.Add(-4167);
FExcel.Workbooks[1].WorkSheets[1].Name:='1';

Colum:=FExcel.Workbooks[1].WorkSheets['1'].Columns;

FExcel.Workbooks[1].WorkSheets['1'].Rows[2].RowHeight:=20;

Sheet:=FExcel.Workbooks[1].WorkSheets['1'];
Sheet.Cells[1,1]:='Форма  удостоверения на приёмку ОТК  ('+DBGrideh1.DataSource.DataSet.FieldByName('nomer').asString+')';
Sheet.Cells[1,1].Font.Bold := True;
Sheet.Cells[1,1].Font.Size := Sheet.Cells[1,2].Font.Size+5;
Sheet.Cells[1,1].Font.name:='Arrial Cyr';
FExcel.Range['A1:I1'].Select;
FExcel.Selection.MergeCells:=True;

Sheet.Cells[2,1]:='№ приемки';
Sheet.Cells[2,1].Font.Bold := True;
Sheet.Cells[2,1].Font.Size := Sheet.Cells[1,2].Font.Size+1;
Sheet.Cells[2,1].Font.name:='Arrial Cyr';
FExcel.Range['A2:A4'].Select;
FExcel.Selection.MergeCells:=True;


Sheet.Cells[2,2]:='Номер, наименование чертежа (РКД)';
Sheet.Cells[2,2].Font.Bold := True;
Sheet.Cells[2,2].Font.Size := Sheet.Cells[1,2].Font.Size+1;
Sheet.Cells[2,2].Font.name:='Arrial Cyr';
FExcel.Range['B2:B4'].Select;
FExcel.Selection.MergeCells:=True;


Sheet.Cells[2,3]:='ПУЕ';
Sheet.Cells[2,3].Font.Bold := True;
Sheet.Cells[2,3].Font.Size := Sheet.Cells[1,2].Font.Size+1;
Sheet.Cells[2,3].Font.name:='Arrial Cyr';
FExcel.Range['C2:C4'].Select;
FExcel.Selection.MergeCells:=True;


Sheet.Cells[2,4]:='Номер ПУЕ ';
Sheet.Cells[2,4].Font.Bold := True;
Sheet.Cells[2,4].Font.Size := Sheet.Cells[1,2].Font.Size+1;
Sheet.Cells[2,4].Font.name:='Arrial Cyr';
FExcel.Range['D2:D4'].Select;
FExcel.Selection.MergeCells:=True;

Sheet.Cells[2,5]:='Наименование ПУЕ ';
Sheet.Cells[2,5].Font.Bold := True;
Sheet.Cells[2,5].Font.Size := Sheet.Cells[1,2].Font.Size+1;
Sheet.Cells[2,5].Font.name:='Arrial Cyr';
FExcel.Range['E2:E4'].Select;
FExcel.Selection.MergeCells:=True;

Sheet.Cells[2,6]:='Результат приёмки*';
Sheet.Cells[2,6].Font.Bold := True;
Sheet.Cells[2,6].Font.Size := Sheet.Cells[1,2].Font.Size+1;
Sheet.Cells[2,6].Font.name:='Arrial Cyr';
FExcel.Range['F2:F4'].Select;
FExcel.Selection.MergeCells:=True;


Sheet.Cells[2,7]:='Подпись по приёмке ';
Sheet.Cells[2,7].Font.Bold := True;
Sheet.Cells[2,7].Font.Size := Sheet.Cells[1,2].Font.Size+1;
Sheet.Cells[2,7].Font.name:='Arrial Cyr';
FExcel.Range['G2:H2'].Select;
FExcel.Selection.MergeCells:=True;

Sheet.Cells[3,7]:='Производственный мастер  ';
Sheet.Cells[3,7].Font.Bold := True;
Sheet.Cells[3,7].Font.Size := Sheet.Cells[1,2].Font.Size+1;
Sheet.Cells[3,7].Font.name:='Arrial Cyr';
FExcel.Range['G3:G4'].Select;
FExcel.Range['G3:G4'].Borders.Weight:=xlHairline;
FExcel.Range['G3:G4'].BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);
FExcel.Selection.MergeCells:=True;

Sheet.Cells[3,8]:='Представитель ОТК ';
Sheet.Cells[3,8].Font.Bold := True;
Sheet.Cells[3,8].Font.Size := Sheet.Cells[1,2].Font.Size+1;
Sheet.Cells[3,8].Font.name:='Arrial Cyr';
FExcel.Range['H3:H4'].Select;
FExcel.Selection.MergeCells:=True;


Sheet.Cells[2,9]:='Примечания, вспом. документы ';
Sheet.Cells[2,9].Font.Bold := True;
Sheet.Cells[2,9].Font.Size := Sheet.Cells[1,2].Font.Size+1;
Sheet.Cells[2,9].Font.name:='Arrial Cyr';
FExcel.Range['I2:I4'].Select;
FExcel.Selection.MergeCells:=True;

FExcel.Range['A1:I4'].Select;
FExcel.Selection.HorizontalAlignment:=xlCenter;
FExcel.Selection.VerticalAlignment:=xlBottom;
FExcel.Range['A2:I4'].Select;
FExcel.Selection.WrapText:=True;

Colum.Columns[1].ColumnWidth:=10;
Colum.Columns[2].ColumnWidth:=25;
Colum.Columns[3].ColumnWidth:=6;
Colum.Columns[4].ColumnWidth:=16;
Colum.Columns[5].ColumnWidth:=20;
Colum.Columns[6].ColumnWidth:=20;
Colum.Columns[7].ColumnWidth:=10;
Colum.Columns[8].ColumnWidth:=10;
Colum.Columns[9].ColumnWidth:=20;

Sheet.Rows[2].ROWHeight:=38;
Sheet.Rows[3].ROWHeight:=27;
Sheet.Rows[4].ROWHeight:=47;

FExcel.Selection.Borders.LineStyle:=12;
FExcel.Selection.Borders.LineStyle:=11;
FExcel.Selection.Borders.LineStyle:=7;
FExcel.Selection.Borders.LineStyle:=8;
FExcel.Selection.Borders.LineStyle:=9;
FExcel.Selection.Borders.LineStyle:=10;

FExcel.Range['A2','I4'].Borders.Weight:=xlHairline;
FExcel.Range['A2','I4'].BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);
index:=6;
 scbr:='';
 Sheet.Cells[5,1]:='1 ';
 Sheet.Cells[5,2]:='2 ';
 Sheet.Cells[5,3]:='3 ';
 Sheet.Cells[5,4]:='4 ';
 Sheet.Cells[5,5]:='5 ';
 Sheet.Cells[5,6]:='6 ';
 Sheet.Cells[5,7]:='7 ';
 Sheet.Cells[5,8]:='8 ';
 Sheet.Cells[5,9]:='9 ';
FExcel.Range['A5','I5'].Borders.Weight:=xlHairline;
FExcel.Range['A5','I5'].BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);
FExcel.Range['A5','I5'].HorizontalAlignment:=xlCenter;
FExcel.Range['A5','I5'].VerticalAlignment:=xlBottom;
     k:=6;  u:=1;
  While  NOT OraQuery4.Eof Do
       begin
       if scbr<>OraQuery4.FieldByName('scbp').asString  then
            begin
             Sheet.Cells[index,2]:=OraQuery4.FieldByName('scbp').asString;
             scbr:=OraQuery4.FieldByName('scbp').asString;
             Sheet.Cells[index,3]:='ТК';
             Sheet.Cells[index,4]:=OraQuery4.FieldByName('nomer1').asString;
             Sheet.Cells[index,5]:=OraQuery4.FieldByName('name1').asString;
            Sheet.Cells[index,1].Font.Bold := True;
            Sheet.Cells[index,2].Font.Bold := True;
            Sheet.Cells[index,3].Font.Bold := True;
            Sheet.Cells[index,4].Font.Bold := True;
            Sheet.Cells[index,5].Font.Bold := True;
            u:=1;Sheet.Cells[index,1]:=u;

            if index<>k then begin
                si:='B'+IntTostr(k)+':B'+Inttostr(index-1);
                FExcel.Range[si].Select;
                FExcel.Selection.MergeCells:=True;
                FExcel.Selection.WrapText:=True;
             end;
               k:=index;
              inc(index);
            end;

             Sheet.Cells[index,4]:=OraQuery4.FieldByName('nomer').asString;
             Sheet.Cells[index,5]:=OraQuery4.FieldByName('name').asString;
             Sheet.Cells[index,3]:='ПТК';
             u:=u+1;
             Sheet.Cells[index,1]:=u;
          inc(index);OraQuery4.Next;
       end;
              si:='B'+IntTostr(k)+':B'+Inttostr(index-1);
                FExcel.Range[si].Select;
                FExcel.Selection.MergeCells:=True;
              FExcel.Range['B6','B'+IntTostr(index-1)].VerticalAlignment:=xlTOP;
////пп
              FExcel.Range['A6:A'+IntTostr(index-1)].Select;
              FExcel.Selection.VerticalAlignment:=xlCenter;
              FExcel.Selection.HorizontalAlignment:=xlCenter;

              FExcel.Range['E6:E'+IntTostr(index-1)].Select;
              FExcel.Selection.WrapText:=True;

              FExcel.Range['A6:I'+IntTostr(index-1)].Select;
              FExcel.Selection.BorderAround(xlContinuous,xlThin,xlAutomatic,xlAutomatic);
               FExcel.Selection.Borders.LineStyle:=12;
FExcel.Selection.Borders.LineStyle:=11;
FExcel.Selection.Borders.LineStyle:=7;
FExcel.Selection.Borders.LineStyle:=8;
FExcel.Selection.Borders.LineStyle:=9;
FExcel.Selection.Borders.LineStyle:=10;
FExcel.Visible:=true;
    end
     else  //проверка на выбор УКР
     ShowMEssage('Данный отчет работает на уровне УКР! Выберите УКР для работы отчета!');


  end;
//////////////////Форма  удостоверения на приёмку ОТК////////////////Форма  удостоверения на приёмку ОТК

end;

end.
