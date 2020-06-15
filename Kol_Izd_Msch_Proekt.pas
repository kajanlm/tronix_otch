unit Kol_Izd_Msch_Proekt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TFKol_Izd_Msch_Proekt = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1kod: TStringField;
    OraQuery1name: TStringField;
    OraQuery1namek: TStringField;
    OraQuery1kolr: TFloatField;
    OraQuery1kolnr: TFloatField;
    OraQuery1kolp: TFloatField;
    OraQuery1koli: TFloatField;
    OraQuery1kols: TFloatField;
    OraQuery1tn: TStringField;
    OraQuery1sp: TStringField;
    OraQuery1sp1: TStringField;
    OraQuery1sp2: TStringField;
    OraQuery1sp3: TStringField;
    OraQuery1prizn: TFloatField;
    OraQuery1idsprav: TFloatField;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
 //   procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FKol_Izd_Msch_Proekt: TFKol_Izd_Msch_Proekt;

implementation

uses Unit9;

{$R *.dfm}

procedure TFKol_Izd_Msch_Proekt.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);

tx:='';
tx:='select tt.kod as kod,tt.name as name,tt.namek as namek,';
tx:=tx+' decode(tt.namek,''ØÒ'',round(tt.kolr,0),round(tt.kolr,1)) as kolr,';
tx:=tx+' decode(tt.namek,''ØÒ'',round(tt.kolnr,0),round(tt.kolnr,1)) as kolnr,';
tx:=tx+' decode(tt.namek,''ØÒ'',round(tt.kolp,0),round(tt.kolp,1)) as kolp,';
tx:=tx+' decode(tt.namek,''ØÒ'',round(tt.koli,0),round(tt.koli,1)) as koli,';
tx:=tx+' decode(tt.namek,''ØÒ'',round(tt.kols,0),round(tt.kols,1)) as kols,';

tx:=tx+' (substr(rtrim(tt.tn),1,255)) as tn,(substr(rtrim(tt.tn),256,254)) as tn1,';

tx:=tx+' (substr(rtrim(tt.sp),1,255)) as sp,(substr(rtrim(tt.sp),256,254)) as sp1,';
tx:=tx+' (substr(rtrim(tt.sp),510,254)) as sp2,(substr(rtrim(tt.sp),764,254)) as sp3,';
tx:=tx+' tt.prizn as prizn,tt.idsprav as idsprav';
tx:=tx+' from (';

tx:=tx+' select ll.kod kod,ll.namek namek,ll.ids idsprav,ll.prizn prizn,';
tx:=tx+' nordsy.get_msc_work(''IZG_ALL'',ll.ids,ll.idpro,ll.ided) kolr,';
tx:=tx+' nordsy.get_msc_work(''IZG'',ll.ids,ll.idpro,ll.ided) kolnr,';
tx:=tx+' nordsy.get_msc_work(''POTR'',ll.ids,ll.idpro,ll.ided) kolp,';
tx:=tx+' nordsy.get_msc_work(''WORK'',ll.ids,ll.idpro,ll.ided) koli,';
tx:=tx+' nordsy.get_msc_work(''VYD'',ll.ids,ll.idpro,ll.ided) kols,';
tx:=tx+' (replace(replace(tronix.sp_name(ll.ids), CHR(13)||CHR(10),'' ''),chr(39), '' '')) name,';
tx:=tx+' (rtrim(NORDSY.KOL_TN_POZ(ll.ids,ll.idpro))) as tn,';
tx:=tx+' (rtrim(tronix.sp_poz_koli(ll.ids,ll.idpro))) as sp';
tx:=tx+' from';
tx:=tx+' (';

tx:=tx+' select s.sprav_id ids,dd.koded_id ided,z.id_project idpro,1 prizn,s.kod kod,dd.namek namek';

tx:=tx+' from nordsy.tx_mat tm,nordsy.texkompl tx,tronix.sprav s,tronix.koded dd,feb_zakaz z';

tx:=tx+' where tm.type_relation_type_relation_id=9';
tx:=tx+' and tm.tex_texkompl_id=tx.texkompl_id(+)';
tx:=tx+' and nordsy.uzak_tx(tx.texkompl_id)=z.nn';
tx:=tx+' and z.id_project='+edit1.text;
tx:=tx+' and upper(z.zak) like (''%%(ÌÑ×)%%'')';
tx:=tx+' and tm.sprav_sprav_id=s.sprav_id(+)';
tx:=tx+' and tm.koded_koded_id=dd.koded_id(+)';
//tx:=tx+' and s.kod in (''15550430050'',''9747151290'',''02030563199'',''1689013158'',''96881611613'',''10410314467'',''1685010748'',''1685010749'')';

tx:=tx+' union';
tx:=tx+' select sp.id_sprav ids, dd.koded_id ided,d.id_project idpro,0 prizn,s.kod kod,dd.namek namek';

tx:=tx+' from tronix.document d,kart_sp sp,tronix.sprav s,tronix.koded dd';

tx:=tx+' where nvl(s.can_do_self,0)=1';
//tx:=tx+' and s.kod in (''15550430050'',''9747151290'',''02030563199'',''1689013158'',''96881611613'',''10410314467'',''1685010748'',''1685010749'')';
tx:=tx+' and sp.nnn=d.document_id';
tx:=tx+' and d.id_project='+edit1.text;
tx:=tx+' and sp.id_sprav=s.sprav_id';
tx:=tx+' and decode(sp.kode_tx,null,decode(sp.kode,null,sp.kode_pr,sp.kode),sp.kode_tx)=dd.koded';
tx:=tx+' and 0=(select nvl(count(*),0) from nordsy.texkompl t,nordsy.tx_mat m';
tx:=tx+' where t.project_project_id='+edit1.text;
tx:=tx+' and t.texkompl_id=m.TEX_TEXKOMPL_ID and m.sprav_sprav_id=s.sprav_id and m.type_relation_type_relation_id=9)';

tx:=tx+' ) ll';
tx:=tx+' ) tt';
tx:=tx+' order by tt.kod';

//ShowMEssage(tx);

  With OraQuery1 Do
     begin
        FieldByName('kod').DisplayLAbel:='ÊÎÄ';
        FieldByName('name').DisplayLAbel:='ÍÀÈÌÅÍÎÂÀÍÈÅ';
        FieldByName('namek').DisplayLAbel:='ÅÄ.ÈÇÌ.';
        FieldByName('kolr').DisplayLAbel:='ÏÎÒÐ-ÒÜ Ñ ÐÎÑÑÛÏÜÞ';
        FieldByName('kolnr').DisplayLAbel:='ÏÎÒÐ-ÒÜ ÁÅÇ ÐÎÑÑÛÏÈ';
        FieldByName('kolp').DisplayLAbel:='ÏÎÒÐ-ÒÜ ÏÎ ÑÏ ';
        FieldByName('koli').DisplayLAbel:='ÈÇÃÎÒÎÂËÅÍÎ';
        FieldByName('kols').DisplayLAbel:='ÂÛÄÀÍÎ';
        FieldByName('tn').DisplayLAbel:='ÒÍ';
        FieldByName('sp').DisplayLAbel:='ÑÏ';
        FieldByName('sp1').DisplayLAbel:='ÑÏ1';
        FieldByName('sp2').DisplayLAbel:='ÑÏ2';
        FieldByName('sp3').DisplayLAbel:='ÑÏ3';
        FieldByName('prizn').DisplayLAbel:='ÏÐÈÇÍÀÊ ';
        FieldByName('idsprav').DisplayLAbel:='IDSPRAV';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TFKol_Izd_Msch_Proekt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFKol_Izd_Msch_Proekt.Button1Click(Sender: TObject);
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

procedure TFKol_Izd_Msch_Proekt.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

    if (Column.FieldName='kolr') and (Column.Field.Dataset.FieldByName('kolr').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='kolnr') and (Column.Field.Dataset.FieldByName('kolnr').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

     if (Column.FieldName='kolp') and (Column.Field.Dataset.FieldByName('kolp').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='koli') and (Column.Field.Dataset.FieldByName('koli').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

        if (Column.FieldName='kols') and (Column.Field.Dataset.FieldByName('kols').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
