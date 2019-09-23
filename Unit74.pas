unit unit74;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComCtrls,ComObj;

type
  TForm74 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1udp: TStringField;
    OraQuery1datotk: TStringField;
    OraQuery1datz: TStringField;
    OraQuery1datr: TStringField;
    OraQuery1abrudp: TStringField;
    OraQuery1idudp: TFloatField;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    OraQuery2: TOraQuery;
    OraQuery2udp: TStringField;
    OraQuery2datotk: TStringField;
    OraQuery2datz: TStringField;
    OraQuery2datr: TStringField;
    OraQuery2abrudp: TStringField;
    OraQuery2idudp: TFloatField;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    OraQuery3: TOraQuery;
    OraQuery1CHK_FLD: TStringField;
    RadioGroup1: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
 private
    { Private declarations }
    procedure SelectData;
  public
    { Public declarations }
  end;

var
  Form74: TForm74;
  MyBookmark: TBookMark;
implementation

uses Unit9;


{$R *.dfm}

procedure TForm74.SelectData;
var tx: string;
begin
tx:=' ';
tx:=tx+'select ''0'' as CHK_FLD, ll.udp as udp, ll.datotk as datotk, ll.datz as datz, ll.datr as datr,ll.abrudp as abrudp,ll.idudp as idudp';
tx:=tx+' from (';

tx:=tx+' select co.name udp,co.annotation annot,co.abbreviation as abrudp,co.concept_id as idudp,';
tx:=tx+' decode(co.date_otk,null,'''',to_char(co.date_otk,''DD.MM.YYYY'')) datotk,';
tx:=tx+' decode(co.date_zakazchik,null,'''',to_char(co.date_zakazchik,''DD.MM.YYYY'')) datz,';
tx:=tx+' decode(co.date_register,null,'''',to_char(co.date_register,''DD.MM.YYYY'')) datr';
tx:=tx+' from dic_concept co where co.shortname like ('''+edit2.Text+'УП%%'')';
tx:=tx+' )ll';
tx:=tx+' order by nordsy.sort_char_number(ll.udp)';
//ShowMEssage(tx);

  OraQuery1.Close;
  With OraQuery1 Do
     begin
        FieldByName('udp').DisplayLAbel:='УДП';
        FieldByName('datotk').DisplayLAbel:='ОТК';
        FieldByName('datz').DisplayLAbel:='ЗАКАЗЧИК';
        FieldByName('datr').DisplayLAbel:='РЕГИСТР';
        FieldByName('abrudp').DisplayLAbel:='УДП-КОРОТКОЕ ';
        FieldByName('idudp').DisplayLAbel:='ID УДП';
    end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;
end;

procedure TForm74.FormShow(Sender: TObject);
var dd,txx,cexuser: string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);

txx:='';
txx:=txx+'select de.nomer from kadry_dep de,kadry_prikaz pii,kadry_type_prikaz tpp where pii.ts_number=USER and pii.escape_date is null';
txx:=txx+' and pii.type_prikaz_type_prikaz_id=tpp.type_prikaz_id and tpp.kod=1 and pii.dep_dep_id=de.dep_id';

  OraQuery3.Close;

  OraQuery3.SQL.Text:=txx;

  OraQuery3.Open;

 cexuser:=OraQuery3.FieldByName('nomer').asString;

  if (cexuser<>'35') and (cexuser<>'43') then
  begin
   Form74.CheckBox1.Enabled:=false;
   Form74.CheckBox2.Enabled:=false;
   Form74.CheckBox3.Enabled:=false;
   Form74.Button2.Enabled:=false;
   Form74.RadioGroup1.Enabled:=false;
   Form74.DBGrideh1.Columns[6].ReadOnly:=true;
   end;

OraQuery3.Close;

DateTimePicker1.DateTime:=date();

SelectData;

end;


procedure TForm74.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close;
end;

procedure TForm74.DBGridEh1DblClick(Sender: TObject);

var tx1,zakr: string;
begin
MyBookMark:= DBGrideh1.DataSource.DataSet.GetBookmark;
if CheckBox1.Checked=true then
begin
zakr:=oraQuery1.FieldByName('datotk').asString;
OraQuery2.Close;
if zakr<>'' then
begin
  if MessageDlg(DBGridEh1.DataSource.DataSet.FieldByName('abrudp').asString + '  уже закрыто ОТК. Вы хотите снять отметку закрытия ОТК?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
 OraQuery2.SQL.Text:='Update dic_concept set date_otk = null where concept_id='+DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
 OraQuery2.ExecSQL;
end
end
else
begin

OraQuery2.SQL.Text:='Update dic_concept set date_otk=to_date('''+datetostr(DateTimePicker1.date)+''',''DD.MM.YYYY'') where concept_id=' + DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
//ShowMEssage(tx1);
OraQuery2.ExecSQL;

end
end;

// Заказчик

if CheckBox2.Checked=true then
begin
zakr:=oraQuery1.FieldByName('datz').asString;
OraQuery2.Close;
if zakr<>'' then
begin
  if MessageDlg(DBGridEh1.DataSource.DataSet.FieldByName('abrudp').asString + '  уже закрыто Заказчиком. Вы хотите снять отметку закрытия Заказчика?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
 OraQuery2.SQL.Text:='Update dic_concept set date_zakazchik = null where concept_id='+DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
 OraQuery2.ExecSQL;
end
end
else
begin
 OraQuery2.SQL.Text:='Update dic_concept set date_zakazchik=to_date('''+datetostr(DateTimePicker1.date)+''',''DD.MM.YYYY'') where concept_id=' + DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
 OraQuery2.ExecSQL;
end
end;
//Регистр

if CheckBox3.Checked=true then
begin
zakr:=oraQuery1.FieldByName('datr').asString;
OraQuery2.Close;
if zakr<>'' then
begin
  if MessageDlg(DBGridEh1.DataSource.DataSet.FieldByName('abrudp').asString + '  уже закрыто Регистром. Вы хотите снять отметку закрытия Регистра?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
 OraQuery2.SQL.Text:='Update dic_concept set date_register = null where concept_id='+DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
 OraQuery2.ExecSQL;
end
end
else
begin
 OraQuery2.SQL.Text:='Update dic_concept set date_register=to_date('''+datetostr(DateTimePicker1.date)+''',''DD.MM.YYYY'') where concept_id=' + DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
 OraQuery2.ExecSQL;
end
 end;

DBGrideh1.DataSource.DataSet.Refresh;

if DBGridEh1.DataSource.DataSet.BookmarkValid(MyBookMark) then
  DBGrideh1.DataSource.DataSet.GotoBookmark(MyBookMark);

end;

procedure TForm74.Button2Click(Sender: TObject);
var tx1: string;
begin

DBGrideh1.DataSource.DataSet.DisableControls;
DBGrideh1.DataSource.DataSet.First;

While not OraQuery1.eof do
Begin
if (RadioGroup1.ItemIndex=0) and (DbGridEh1.DataSource.DataSet.FieldByName('chk_fld').asString='0') then
else
begin
if CheckBox1.Checked=true then
begin
 tx1:=oraQuery1.FieldByName('datotk').asString;
 OraQuery2.Close;

if tx1<>'' then
begin
  if MessageDlg(DBGridEh1.DataSource.DataSet.FieldByName('abrudp').asString + '  уже закрыто ОТК. Вы хотите снять отметку закрытия ОТК?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
 OraQuery2.SQL.Text:='Update dic_concept set date_otk = null where concept_id='+DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
 OraQuery2.ExecSQL;
end
end
else
begin
 OraQuery2.SQL.Text:='Update dic_concept set date_otk=to_date('''+datetostr(DateTimePicker1.date)+''',''DD.MM.YYYY'') where concept_id=' + DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
 OraQuery2.ExecSQL;
end
 end;

//
if CheckBox2.Checked=true then
begin
tx1:=oraQuery1.FieldByName('datz').asString;
OraQuery2.Close;

if tx1<>'' then
begin
  if MessageDlg(DBGridEh1.DataSource.DataSet.FieldByName('abrudp').asString + '  уже закрыто Заказчиком. Вы хотите снять отметку закрытия Заказчика?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
 OraQuery2.SQL.Text:='Update dic_concept set date_zakazchik = null where concept_id='+DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
 OraQuery2.ExecSQL;
end
end
else
begin
 OraQuery2.SQL.Text:='Update dic_concept set date_zakazchik=to_date('''+datetostr(DateTimePicker1.date)+''',''DD.MM.YYYY'') where concept_id=' + DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
 OraQuery2.ExecSQL;
end
 end;
 //
if CheckBox3.Checked=true then
begin
tx1:=oraQuery1.FieldByName('datr').asString;
 OraQuery2.Close;

if tx1<>'' then
begin
  if MessageDlg(DBGridEh1.DataSource.DataSet.FieldByName('abrudp').asString + '  уже закрыто Регистром. Вы хотите снять отметку закрытия Регистра?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
 OraQuery2.SQL.Text:='Update dic_concept set date_register = null where concept_id='+DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
 OraQuery2.ExecSQL;
end
end
else
begin
 OraQuery2.SQL.Text:='Update dic_concept set date_register=to_date('''+datetostr(DateTimePicker1.date)+''',''DD.MM.YYYY'') where concept_id=' + DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
 OraQuery2.ExecSQL;
end
 end;
end;

oraQuery1.Next;
end;

DBGridEh1.DataSource.DataSet.EnableControls;

DBGrideh1.DataSource.DataSet.Refresh;

End;

procedure TForm74.Button1Click(Sender: TObject);
var
FExcel,Sheet,Range: OleVariant;
Nk: integer;
begin

nk := 4;

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_UDP_OTK_74.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_UDP_OTK_74.xls');

FExcel.Workbooks[1].WorkSheets[1].Name := 'УДП';
sheet:=FExcel.Workbooks[1].WorkSheets[1];
//Sheet.Cells[1,1 ].Value:='УДП:      '+ Form9.oraQuery1.FieldByName('name').asString;
Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[1,4]].Value:='УДП:      '+ Form9.oraQuery1.FieldByName('name').asString;

DBGridEh1.DataSource.DataSet.DisableControls;
OraQuery1.First;

While not OraQuery1.eof do
Begin

Sheet.Cells[nk,1].Value:=OraQuery1.FieldByName('udp').asString;
Sheet.Cells[nk,2].Value:=OraQuery1.FieldByName('datotk').asString;
Sheet.Cells[nk,3].Value:=OraQuery1.FieldByName('datz').asString;
Sheet.Cells[nk,4].Value:=OraQuery1.FieldByName('datr').asString;

Inc(nk);

oraQuery1.Next;

End;

Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[nk+1,4]].RowHeight :=18;
Sheet.Range[Sheet.Cells[2,1], Sheet.Cells[nk,4]].borders.linestyle:=xlContinuous;

OraQuery1.First;
DBGridEh1.DataSource.DataSet.EnableControls;

FExcel.Visible:=True;
end;

end.

