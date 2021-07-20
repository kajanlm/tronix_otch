unit Rasxod_mater_otgr_prixod_order_last_buy_for_cfek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls, ComObj;

type
  TFRasxod_mater_otgr_prixod_order_last_buy_for_cfek = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1godins: TStringField;
    OraQuery1kodotgr: TStringField;
    OraQuery1obosn: TFloatField;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Txtgodz: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    RichEdit1: TRichEdit;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure TxtgodzChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRasxod_mater_otgr_prixod_order_last_buy_for_cfek: TFRasxod_mater_otgr_prixod_order_last_buy_for_cfek;
 dn: string;
 dk: string;
 godz: string;
implementation

uses Unit9;

{$R *.dfm}

procedure TFRasxod_mater_otgr_prixod_order_last_buy_for_cfek.FormShow(Sender: TObject);
begin
//ShowMessage(Edit1.Text);
//ShowMessage(Edit2.Text);
//Edit1.Text:='4011';
//ShowMessage(Form58.Caption);
//ShowMessage(Edit3.Text);

DateTimePicker1.DateTime:=StrToDate(Edit3.Text);
DateTimePicker2.DateTime:=date();
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);

Txtgodz.Text:=IntToStr(CurrentYear());
godz:=Txtgodz.Text;
//ShowMessage('godz='+godz);
end;

procedure TFRasxod_mater_otgr_prixod_order_last_buy_for_cfek.Button2Click(Sender: TObject);
var FExcel,Sheet: OleVariant;
tx:string;
nk: integer;
ngod: integer;
begin

ngod:=CurrentYear();
//ShowMessage('ngod='+IntToStr(ngod));
//ShowMessage(ngod);

if CheckBox1.Checked=false then
tx:=tx+'select distinct tt.godins as godins, tt.kod as kodotgr, tronix.sele_max_id_prixod(tt.spravid,tt.godins) as obosn';

if CheckBox1.Checked=true then
tx:=tx+'select distinct tt.godins as godins, tt.kod as kodotgr, tronix.sele_max_id_prixod(tt.spravid,'+godz+') as obosn';

tx:=tx+' from(';

tx:=tx+' select s.kod kod, substr(to_char( tn.date_ins, ''DD.MM.YYYY'' ),7,4) godins,s.sprav_id spravid';
tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.sprav s,feb_zakaz zk,tronix.project_list pr';   
 
tx:=tx+' where tm.ttn_ttn_id=tn.ttn_id and tn.type_ttn_type_ttn_id in (5,12,9,44,59,11)';   
tx:=tx+' and tm.sprav_sprav_id=s.sprav_id and tronix.select_mat(s.tree_tree_id,''01'')=1';   
tx:=tx+' and nvl(tm.kol_uchet,0)<>0 and nvl(s.can_do_self,0)=0';  
tx:=tx+' and tm.sprav_sprav_id_zam_snab is null';
tx:=tx+' and tn.uzak_uzak_id=zk.nn and zk.id_project='+edit1.text;
tx:=tx+' and pr.project_id=zk.id_project';
tx:=tx+' and tn.user_date1 is not null and tn.date_ins is not null';
tx:=tx+' and to_char(tn.date_ins, ''YYYYMMDD'' )>='+dn;
tx:=tx+' and to_char(tn.date_ins, ''YYYYMMDD'' )<='+dk;

tx:=tx+' union all';
 
tx:=tx+' select s.kod kod, substr(to_char( tn.date_ins, ''DD.MM.YYYY'' ),7,4) godins,s.sprav_id spravid';
tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.sprav s,feb_zakaz zk,tronix.project_list pr';   
 
tx:=tx+' where tm.ttn_ttn_id=tn.ttn_id and tn.type_ttn_type_ttn_id in (5,12,9,44,59,11)';   
tx:=tx+' and tm.sprav_sprav_id=s.sprav_id and tronix.select_mat(s.tree_tree_id,''01'')=1';
tx:=tx+' and tm.sprav_sprav_id_zam_snab is not null';
tx:=tx+' and nvl(tm.kol_uchet,0)<>0 and nvl(s.can_do_self,0)=0';
tx:=tx+' and tn.uzak_uzak_id=zk.nn and zk.id_project='+edit1.text;
tx:=tx+' and pr.project_id=zk.id_project';
tx:=tx+' and tn.user_date1 is not null and tn.date_ins is not null';
tx:=tx+' and to_char(tn.date_ins, ''YYYYMMDD'' )>='+dn;
tx:=tx+' and to_char(tn.date_ins, ''YYYYMMDD'' )<='+dk;
tx:=tx+' ) tt';

//ShowMEssage(tx);
 
{*
 With OraQuery1 Do
     begin
        FieldByName('godins').DisplayLAbel:='ÃÎÄ ';
        FieldByName('kodotgr').DisplayLAbel:='ÊÎÄ ÎÒÃÐ. ';
        FieldByName('obosn').DisplayLAbel:='ÎÁÎÑÍÎÂÀÍÈÅ ';
     end;
*}

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

 nk:=1;

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_MATER_OTGR_PRIXOD_ORDER_LAST_BUY_FOR_CFEK.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_MATER_OTGR_PRIXOD_ORDER_LAST_BUY_FOR_CFEK.xls');

FExcel.Workbooks[1].WorkSheets[1].Name := 'Ëèñò1';
sheet:=FExcel.Workbooks[1].WorkSheets[1];

OraQuery1.First;

While not OraQuery1.eof do
Begin

Inc(nk);

Sheet.Cells[nk,1].Value:=OraQuery1.FieldByName('godins').asString;
Sheet.Cells[nk,2].Value:=OraQuery1.FieldByName('kodotgr').asString;
Sheet.Cells[nk,3].Value:=OraQuery1.FieldByName('obosn').asFloat;
Sheet.Cells[nk,4].Value:=edit2.text;

OraQuery1.Next;
end;    //While not OraQuery1.eof do

Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[nk+1,4]].RowHeight:=16;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,4]].HorizontalAlignment:=xlGeneral;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,4]].VerticalAlignment:=xlTop;
//Sheet.Range[Sheet.Cells[4,1], Sheet.Cells[nk,4]].WrapText:=True;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,4]].Rows.AutoFit;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,4]].borders.linestyle:=xlContinuous;
FExcel.Visible:=True;
FRasxod_mater_otgr_prixod_order_last_buy_for_cfek.Close;

end;    // procedure TFRasxod_mater_otgr_prixod_order_last_buy_for_cfek.FormShow(Sender: TObject);

procedure TFRasxod_mater_otgr_prixod_order_last_buy_for_cfek.DateTimePicker1Change(Sender: TObject);
begin
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
end;

procedure TFRasxod_mater_otgr_prixod_order_last_buy_for_cfek.DateTimePicker2Change(Sender: TObject);
begin
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;

procedure TFRasxod_mater_otgr_prixod_order_last_buy_for_cfek.TxtgodzChange(Sender: TObject);
begin
godz:=TxtGodz.Text;
end;

procedure TFRasxod_mater_otgr_prixod_order_last_buy_for_cfek.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked=false then
 Button2.Enabled:=true;

if CheckBox1.Checked=true then
begin

if length(TxtGodz.Text)<4 then
ShowMessage('Óêàæèòå ãîä ïðàâèëüíî!!!');

Button2.Enabled:=length(TxtGodz.Text)=4;
end
end;

procedure TFRasxod_mater_otgr_prixod_order_last_buy_for_cfek.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

end.
