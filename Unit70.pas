unit Unit70;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComObj;

type
  TForm70 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1udp: TStringField;
    OraQuery1trnorm: TFloatField;
    OraQuery1trzakr: TFloatField;
    OraQuery1trost: TFloatField;
    OraQuery1procent: TFloatField;
    OraQuery1udpdat: TStringField;
    OraQuery1prizn: TStringField;
    OraQuery1zak: TStringField;
    OraQuery1abrudp: TStringField;
    OraQuery1idudp: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField7: TFloatField;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Button4Click(Sender: TObject);
 private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form70: TForm70;

implementation
uses Unit9,Unit71,Unit77;


{$R *.dfm}

procedure TForm70.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);

tx:=' ';
tx:=tx+'select substr(ll.udp,1,254) as udp, ll.trnorm as trnorm, ll.trzakr as trzakr,ll.trost as trost,';
tx:=tx+' (decode(ll.trzakr,0,0,decode(ll.trnorm,0,'''',round((ll.trzakr/ll.trnorm)*100,2)))) as procent,ll.udpdat as udpdat,ll.prizn as prizn,';
tx:=tx+' (select pr.name from tronix.project_list pr where pr.project_id='+edit1.text+') as zak,';
tx:=tx+' ll.abrudp as abrudp,ll.idudp as idudp';
tx:=tx+' from (';

tx:=tx+'select l.udp udp, sum(l.trudnorm) trnorm, sum(l.trudzakr) trzakr,(sum(l.trudnorm)-sum(l.trudzakr)) trost,';
tx:=tx+' max(l.udpdat) udpdat,max(l.udpa) abrudp,max(l.idudp) idudp,max(l.prizn) prizn';
tx:=tx+' from (';
tx:=tx+' select co.name udp,co.abbreviation udpa,0 trudnorm,0 trudzakr,to_char(co.date_otk,''DD.MM.YYYY'') udpdat,co.concept_id idudp,'' '' prizn';
tx:=tx+' from dic_concept co where co.shortname like ('''+edit2.Text;
tx:=tx+'”œ%%'')';

tx:=tx+' union all';

tx:=tx+' select t.txdic udp,t.txudpa udpa,sum(t.trudnorm) trnorm,max(0) trzakr,'' '' udpdat,0 idudp,'' '' prizn';
tx:=tx+' from( ';
tx:=tx+' select distinct tx.texkompl_id, tronix_up_tk_dic(tx.texkompl_id) txdic,tronix_up_tk_dic_short(tx.texkompl_id) txudpa,';
tx:=tx+' nordsy.sum_trud(tx.texkompl_id) trudnorm';
tx:=tx+' from tx_tex_kvalif tv,tx_texkompl tx,feb_zakaz zk,tronix.project_list pr';
tx:=tx+' where tv.texkompl_texkompl_id=tx.texkompl_id(+) and pr.project_id=tx.project_project_id and tx.project_project_id='+edit1.text;
tx:=tx+' and nordsy.uzak_tx(tx.texkompl_id)=zk.nn and zk.zak not like (''%%(Ã—◊)'')';
tx:=tx+' )t';
tx:=tx+' group by t.txdic,t.txudpa';

tx:=tx+' union all';

tx:=tx+' select tt.txdic udp,tt.txudpa udpa,max(0) trnorm,sum(tt.trudzakr) trzakr ,'' '' udpdat,0 idudp,'' '' prizn';
tx:=tx+' from(';
tx:=tx+' select trim(tronix_up_tk_dic(tx.texkompl_id)) txdic,tronix_up_tk_dic_short(tx.texkompl_id) txudpa,';
tx:=tx+' tx.texkompl_id,sum(tm.trudoem) trudzakr';

tx:=tx+' from tronix_ttn tn,tronix_ttn_mat tm,tx_texkompl tx,feb_zakaz zk,tronix.project_list pr';

tx:=tx+' where tx.project_project_id='+edit1.text;
tx:=tx+' and pr.project_id=tx.project_project_id';
tx:=tx+' and zk.zak not like (''%%(Ã—◊)'') and tn.uzak_uzak_id=zk.nn';
tx:=tx+' and tn.type_ttn_type_ttn_id =60 and tm.ttn_ttn_id=tn.ttn_id';
tx:=tx+' and tn.texkompl_texkompl_id_NAR=tx.texkompl_id(+)';
tx:=tx+' and tn.date_ins is not null and tn.date_anul_nar is null';
tx:=tx+' group by tronix_up_tk_dic(tx.texkompl_id),tronix_up_tk_dic_short(tx.texkompl_id),tx.texkompl_id';
tx:=tx+' ) tt';
tx:=tx+' group by tt.txdic,tt.txudpa';

tx:=tx+' union';

tx:=tx+' select distinct tronix_up_tk_dic(tx.texkompl_id) udp,tronix_up_tk_dic_short(tx.texkompl_id) udpa,0 trudnorm,0 trudzakr,'' '' udpdat,0 idudp,''V'' prizn';
tx:=tx+' from nordsy.texkompl tx,feb_zakaz zk,tronix.project_list pr';
   
tx:=tx+' where tx.project_project_id=494 and pr.project_id=tx.project_project_id ';  
tx:=tx+' and nordsy.uzak_tx(tx.texkompl_id)=zk.nn and upper(zk.zak) not like (''%%(Ã—◊)'') ';  
tx:=tx+' and tx.type_tex_type_tex_id not in (11,13)';
tx:=tx+' and not exists (select * from tx_texkompl tt where tt.texkompl_texkompl_id=tx.texkompl_id)';
tx:=tx+' and not exists (select * from tx_tex_kvalif tv where tv.texkompl_texkompl_id=tx.texkompl_id)';
//tx:=tx+' and tronix_up_tk_dic_short(tx.texkompl_id)=''”œ-3''';
tx:=tx+' and tronix_up_tk_dic_short(tx.texkompl_id) is not null';
tx:=tx+' )l';
tx:=tx+' group by l.udp';
tx:=tx+' )ll';
tx:=tx+' order by nordsy.sort_char_number(ll.udp)';
//ShowMEssage(tx);

  With OraQuery1 Do
     begin
        FieldByName('udp').DisplayLAbel:='œ”≈1';
        FieldByName('trnorm').DisplayLAbel:='ƒ¿“¿ Œ“◊®“¿ œ”≈1';
        FieldByName('trzakr').DisplayLAbel:='”ƒœ œ”≈1';
        FieldByName('trost').DisplayLAbel:='”ƒœ œ”≈1';
        FieldByName('procent').DisplayLAbel:='%';
        FieldByName('udpdat').DisplayLAbel:='”ƒœ «¿ –€“Œ';
        FieldByName('prizn').DisplayLAbel:='≈—“‹ “–-“‹=0';
        FieldByName('zak').DisplayLAbel:='œ–Œ≈ “';
        FieldByName('abrudp').DisplayLAbel:='”ƒœ œ”≈2 ';
        FieldByName('idudp').DisplayLAbel:='ID ”ƒœ ';
    end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TForm70.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TForm70.Button1Click(Sender: TObject);
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

procedure TForm70.DBGridEh1DblClick(Sender: TObject);
begin
  Application.CreateForm(TForm71, Form71);
  Form71.Edit1.Text:=Form70.Edit1.Text;
  Form71.edit2.Text:=oraQuery1.FieldByName('abrudp').asString;
  Form71.Caption:='œÓÂÍÚ: '+Form9.oraQuery1.FieldByName('name').asString;
  Form71.Caption:=Form71.Caption+'  ”ƒœ: '+oraQuery1.FieldByName('udp').asString;
  Form71.ShowModal();
  Form71.Free;
 end;

procedure TForm70.Button2Click(Sender: TObject);
begin
   Application.CreateForm(TForm71, Form71);
  Form71.Edit1.Text:=Form70.Edit1.Text;
  Form71.Edit2.Text:='All';
//  Form71.Edit3.Text:=Form9.oraQuery1.FieldByName('name').asString;
  Form71.Caption:='œÓÂÍÚ: '+Form9.oraQuery1.FieldByName('name').asString;
  Form71.ShowModal();
  Form71.Free;
 end;

procedure TForm70.Button3Click(Sender: TObject);
var
FExcel,Sheet,Range: OleVariant;
Nk: integer;
begin

nk := 5;

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_UDP_70.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_UDP_70.xls');

FExcel.Workbooks[1].WorkSheets[1].Name := '”ƒœ';
sheet:=FExcel.Workbooks[1].WorkSheets[1];
Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[1,7]].Value:='”ƒœ:      '+ Form9.oraQuery1.FieldByName('name').asString;

DBGridEh1.DataSource.DataSet.DisableControls;
OraQuery1.First;

While not OraQuery1.eof do
Begin

Sheet.Cells[nk,1].Value:=OraQuery1.FieldByName('udp').asString;
Sheet.Cells[nk,2].Value:=OraQuery1.FieldByName('procent').asString;
Sheet.Cells[nk,3].Value:=OraQuery1.FieldByName('udpdat').asString;

if oraQuery1.FieldByName('prizn').asString='V' then
begin
Sheet.Range[Sheet.Cells[nk,2],Sheet.Cells[nk,3]].Interior.ColorIndex:=3;
Sheet.Range[Sheet.Cells[nk,2],Sheet.Cells[nk,3]].Font.Bold:=True;
end;

Inc(nk);

oraQuery1.Next;

End;

Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[nk+1,7]].RowHeight :=18;
Sheet.Range[Sheet.Cells[4,1], Sheet.Cells[nk,7]].HorizontalAlignment:=xlGeneral;
Sheet.Range[Sheet.Cells[4,1], Sheet.Cells[nk,7]].VerticalAlignment:=xlTop;
Sheet.Range[Sheet.Cells[4,1], Sheet.Cells[nk,7]].WrapText:=True;
Sheet.Range[Sheet.Cells[4,1], Sheet.Cells[nk,7]].Rows.AutoFit;
Sheet.Range[Sheet.Cells[2,1], Sheet.Cells[nk,7]].borders.linestyle:=xlContinuous;

OraQuery1.First;
DBGridEh1.DataSource.DataSet.EnableControls;

FExcel.Visible:=True;
end;

procedure TForm70.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
if Column.Field.Dataset.FieldByName('prizn').AsString='V' then
  TDBGridEh(Sender).canvas.font.color:=clred;
 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end; 
procedure TForm70.Button4Click(Sender: TObject);
begin
  Application.CreateForm(TForm77, Form77);
  Form77.Edit1.Text:=Form70.Edit1.Text;
  Form77.Caption:='œÓÂÍÚ: '+Form9.oraQuery1.FieldByName('name').asString;
  Form77.Caption:=Form77.Caption+'  œ”≈ Ò ÚÛ‰Ó∏ÏÍÓÒÚ¸˛ 0';
  Form77.ShowModal();
  Form77.Free;
 end;

end.
