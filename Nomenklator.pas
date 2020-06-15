unit Nomenklator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComCtrls,ComObj;

type
  TFNomenklator = class(TForm)
    OraQuery1: TOraQuery;
    Edit1: TEdit;
    Edit2: TEdit;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNomenklator: TFNomenklator;

implementation


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
FExcel,Sheet,Range: OleVariant;
ns,ttx,tx:string;
nn: integer;
begin

ttx:='order by tt.tree,tt.kod';

tx:='';
tx:=tx+'select tt.kod as kod,tt.ogran as ogran,tt.shome as shome,tt.msch as msch,tt.rossip as rossip,';
tx:=tx+' tt.edo as edo,tt.edn as edn,tt.ch as ch,tt.chold as chold,tt.chdop as chdop,';
tx:=tx+' replace(replace(tt.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') as name,tt.nttp as nttp,';
tx:=tx+' replace(replace(tt.tree,CHR(13)||CHR(10),'' ''),chr(39), '' '') as tree';
tx:=tx+' from(';

tx:=tx+' select t.kod kod,t.ogran ogran,t.shome shome,t.chold chold,t.ch ch,t.msch msch,t.rossip rossip,';
tx:=tx+' t.edo edo,t.edn edn,t.name name,t.chdop chdop,t.nttp nttp,t.tree tree';
tx:=tx+' from (';

tx:=tx+' select s.kod kod,tronix.sp_name(s.sprav_id) name,tronix.full_tree_name('''',s.sprav_id) tree,';
tx:=tx+' decode(nvl(s.l_ogran,0),0,'' '',''*'') ogran, decode(nvl(s.home,0),0,'' '',''1'') shome,';
tx:=tx+' decode(nvl(s.can_do_self,0),0,'' '',''1'') msch,decode(nvl(s.rossip,0),0,'' '',''1'') rossip,';
tx:=tx+' decode(s.koded_koded_id,null,'''',(select namek from tronix.koded where s.koded_koded_id=koded_id)) edo,';
tx:=tx+' decode(s.koded_koded_id2,null,'''',(select namek from tronix.koded where s.koded_koded_id2=koded_id)) edn,';
tx:=tx+' s.oboznold chold,s.dobozb chdop,s.nttp nttp,';
tx:=tx+' decode(s.typ_lov_typ_lov_id,null,'''',(select kod from tronix.typ_lov where s.typ_lov_typ_lov_id=typ_lov_id(+))) ch';
tx:=tx+' from tronix.sprav s';

if RadioGroup2.ItemIndex=0 then
tx:=tx+' where tronix.select_mat(s.tree_tree_id,''01'')=1 and substr(s.name,1,14)<>''(ÌÂ ·‡Ú¸ ÍÓ‰)''';

if RadioGroup2.ItemIndex=1 then
tx:=tx+' where tronix.select_mat(s.tree_tree_id,''02'')=1 and substr(s.name,1,14)<>''(ÌÂ ·‡Ú¸ ÍÓ‰)''';

tx:=tx+') t';
tx:=tx+' where substr(t.kod,1,1)<>''?''';
tx:=tx+' ) tt';

if RadioGroup1.ItemIndex=1 then
ttx:='order by tt.kod';
tx:=tx+' '+ttx;

//ShowMEssage(tx);
OraQuery1.Close;
OraQuery1.SQL.Text:=tx;

OraQuery1.ExecSQL;

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_NOMENKLATOR.xlsx');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_NOMENKLATOR.xlsx');

if RadioGroup2.ItemIndex=0 then
FExcel.Workbooks[1].WorkSheets[1].Name := 'Ã¿“≈–»¿À€';

if RadioGroup2.ItemIndex=1 then
FExcel.Workbooks[1].WorkSheets[1].Name := 'Œ¡Œ–”ƒŒ¬¿Õ»≈';

sheet:=FExcel.Workbooks[1].WorkSheets[1];

OraQuery1.Open;
OraQuery1.First;

nn:=1;
While not OraQuery1.eof do
Begin
inc(nn);
ns:=IntToStr(nn);

Sheet.Cells[nn,1].Value:=OraQuery1.FieldByName('kod').asString;
//Sheet.Range[ran].HorizontalAlignment:=xlCenter;
Sheet.Cells[nn,2].Value:=OraQuery1.FieldByName('ogran').asString;
Sheet.Cells[nn,3].Value:=OraQuery1.FieldByName('shome').asString;
Sheet.Cells[nn,4].Value:=OraQuery1.FieldByName('msch').asString;
Sheet.Cells[nn,5].Value:=OraQuery1.FieldByName('rossip').asString;
Sheet.Cells[nn,6].Value:=OraQuery1.FieldByName('edo').asString;
Sheet.Cells[nn,7].Value:=OraQuery1.FieldByName('edn').asString;
Sheet.Cells[nn,8].Value:=OraQuery1.FieldByName('name').asString;
Sheet.Cells[nn,9].Value:=OraQuery1.FieldByName('ch').asString;
Sheet.Cells[nn,10].Value:=OraQuery1.FieldByName('chold').asString;
Sheet.Cells[nn,11].Value:=OraQuery1.FieldByName('chdop').asString;
Sheet.Cells[nn,12].Value:=OraQuery1.FieldByName('nttp').asString;
Sheet.Cells[nn,13].Value:=OraQuery1.FieldByName('tree').asString;

oraQuery1.Next;
End;

ns:=IntToStr(nn);
Sheet.Range[Sheet.Cells[2,1], Sheet.Cells[nn,13]].borders.linestyle:=xlContinuous;

FExcel.Visible:=True;
end;

procedure TFNomenklator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;


end.
