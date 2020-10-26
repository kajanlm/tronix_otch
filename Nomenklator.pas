unit Nomenklator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls;

type
  TFNomenklator = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1kod: TStringField;
    OraQuery1ogran: TStringField;
    OraQuery1shome: TStringField;
    OraQuery1msch: TStringField;
    OraQuery1rossip: TStringField;
    OraQuery1edo: TStringField;
    OraQuery1edn: TStringField;
    OraQuery1massaed: TFloatField;
    OraQuery1name: TStringField;
    OraQuery1ch: TStringField;
    OraQuery1chold: TStringField;
    OraQuery1chdop: TStringField;
    OraQuery1nttp: TStringField;
    OraQuery1tree: TStringField;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNomenklator: TFNomenklator;

implementation

uses Unit9;

{$R *.dfm}

procedure TFNomenklator.FormShow(Sender: TObject);
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);
end;

procedure TFNomenklator.Button2Click(Sender: TObject);
var
ttx,tx:string;
begin

ttx:='order by tt.tree,tt.kod';

tx:='';
tx:=tx+'select tt.kod as kod,tt.ogran as ogran,tt.shome as shome,tt.msch as msch,tt.rossip as rossip,';
tx:=tx+' tt.edo as edo,tt.edn as edn,decode(tt.massaed,null,0,to_number(tt.massaed,''999999999.999999'')) as massaed,';
tx:=tx+' tt.ch as ch,tt.chold as chold,tt.chdop as chdop,';
tx:=tx+' replace(replace(tt.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') as name,tt.nttp as nttp,';
tx:=tx+' replace(replace(tt.tree,CHR(13)||CHR(10),'' ''),chr(39), '' '') as tree';
tx:=tx+' from(';

tx:=tx+' select t.kod kod,t.ogran ogran,t.shome shome,t.chold chold,t.ch ch,t.msch msch,t.rossip rossip,';
tx:=tx+' t.edo edo,t.edn edn,t.massaed massaed,t.name name,t.chdop chdop,t.nttp nttp,t.tree tree';
tx:=tx+' from (';

tx:=tx+' select s.kod kod,tronix.sp_name(s.sprav_id) name,tronix.full_tree_name('''',s.sprav_id) tree,';
tx:=tx+' decode(nvl(s.l_ogran,0),0,'' '',''*'') ogran, decode(nvl(s.home,0),0,'' '',''1'') shome,';
tx:=tx+' decode(nvl(s.can_do_self,0),0,'' '',''1'') msch,decode(nvl(s.rossip,0),0,'' '',''1'') rossip,';
tx:=tx+' decode(s.koded_koded_id,null,'''',(select namek from tronix.koded where s.koded_koded_id=koded_id)) edo,';
tx:=tx+' decode(s.koded_koded_id2,null,'''',(select namek from tronix.koded where s.koded_koded_id2=koded_id)) edn,';
tx:=tx+' decode(s.mass,null,'''',s.mass) massaed,';
tx:=tx+' s.oboznold chold,s.dobozb chdop,s.nttp nttp,';
tx:=tx+' decode(s.typ_lov_typ_lov_id,null,'''',(select name from tronix.typ_lov where typ_lov_id=s.typ_lov_typ_lov_id)) ch';
tx:=tx+' from tronix.sprav s';

if RadioGroup2.ItemIndex=0 then
tx:=tx+' where tronix.select_mat(s.tree_tree_id,''01'')=1 and nvl(s.can_do_self,0)=0';

if RadioGroup2.ItemIndex=1 then
tx:=tx+' where tronix.select_mat(s.tree_tree_id,''02'')=1 and nvl(s.can_do_self,0)=0 and (select upper(name) from tronix_tree where tree_id=s.tree_tree_id)<>''Œ—Õ¿—“ ¿''';

if RadioGroup2.ItemIndex=2 then
tx:=tx+' where nvl(s.can_do_self,0)=1';

if RadioGroup2.ItemIndex=3 then
tx:=tx+' where tronix.select_mat(s.tree_tree_id,''02'')=1 and nvl(s.can_do_self,0)=0 and (select upper(name) from tronix_tree where tree_id=s.tree_tree_id)=''Œ—Õ¿—“ ¿''';

tx:=tx+') t';
tx:=tx+' where substr(t.kod,1,1)<>''?''';
tx:=tx+' ) tt';

if RadioGroup1.ItemIndex=1 then
ttx:='order by tt.kod';
tx:=tx+' '+ttx;

//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('kod').DisplayLAbel:=' Œƒ ';
        FieldByName('ogran').DisplayLAbel:='Œ√–¿Õ. ';
        FieldByName('shome').DisplayLAbel:='œ–»Œ–»“≈“ ';
        FieldByName('msch').DisplayLAbel:='Ã—◊ ';
        FieldByName('rossip').DisplayLAbel:='–Œ——€œ‹ ';
        FieldByName('edo').DisplayLAbel:='≈ƒ.»«Ã.Œ—Õ. ';
        FieldByName('edn').DisplayLAbel:='≈ƒ.»«Ã.Õ≈Œ—Õ. ';
        FieldByName('massaed').DisplayLAbel:='Ã¿——¿ ≈ƒ. ';
        FieldByName('name').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ ';
        FieldByName('ch').DisplayLAbel:='◊≈–“®∆ ';
        FieldByName('chold').DisplayLAbel:='◊≈–“®∆ —“¿–€… ';
        FieldByName('chdop').DisplayLAbel:='◊≈–“®∆ ƒŒœ. ';
        FieldByName('nttp').DisplayLAbel:='Õ““œ ';
        FieldByName('tree').DisplayLAbel:='¬≈“ ¿ ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TFNomenklator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFNomenklator.Button1Click(Sender: TObject);
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



procedure TFNomenklator.RadioGroup2Click(Sender: TObject);
begin
if RadioGroup2.ItemIndex=0 then
 caption:='    Ã¿“≈–»¿À€ ·ÂÁ Ã—◊';

if RadioGroup2.ItemIndex=1 then
 caption:='    Œ¡Œ–”ƒŒ¬¿Õ»≈ ·ÂÁ Ã—◊ Ë ŒÒÌ‡ÒÚÍË';

if RadioGroup2.ItemIndex=2 then
 caption:='    Ã—◊';

if RadioGroup2.ItemIndex=3 then
 caption:='    Œ—Õ¿—“ ¿';
end;

end.
