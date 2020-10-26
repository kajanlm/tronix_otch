unit Vedom_snab_vetka_cfek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls;

type
  TFVedom_snab_vetka_cfek = class(TForm)
    DBGridEh1: TDBGridEh;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1zavn: TStringField;
    OraQuery1proe: TStringField;
    OraQuery1sp: TStringField;
    OraQuery1pozic: TStringField;
    OraQuery1podpoz: TStringField;
    OraQuery1namesp: TStringField;
    OraQuery1kod: TStringField;
    OraQuery1namekod: TStringField;
    OraQuery1kol: TFloatField;
    OraQuery1kodedi: TStringField;
    OraQuery1edi: TStringField;
    OraQuery1vetka1: TStringField;
    OraQuery1vetka2: TStringField;
    OraQuery1vetka3: TStringField;
    OraQuery1vetka4: TStringField;
    OraQuery1vetka5: TStringField;
    OraQuery1vetka6: TStringField;
    OraQuery1vetka7: TStringField;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVedom_snab_vetka_cfek: TFVedom_snab_vetka_cfek;
implementation

uses Unit9;

{$R *.dfm}


procedure TFVedom_snab_vetka_cfek.FormShow(Sender: TObject);
var
tx: string;
begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='4011';
//ShowMessage(Form58.Caption);

tx:=' ';
tx:='select tt.zavn as zavn, tt.proe as proe, tt.sp as sp,tt.pozic as pozic,tt.podpoz as podpoz,tt.namesp as namesp,';
tx:=tx+' tt.kod as kod,tt.namekod as namekod,tt.kol as kol,tt.kodedi as kodedi,tt.edi as edi,';
tx:=tx+' tt.vetka1 as vetka1,tt.vetka2 as vetka2,vetka3 as vetka3,vetka4 as vetka4,vetka5 as vetka5,vetka6 as vetka6,tt.vetka7 as vetka7';
tx:=tx+' from (';

tx:=tx+' select t.zavn zavn, t.proe proe, t.sp sp,t.pozic pozic,t.podpoz podpoz,t.namesp namesp,';
tx:=tx+' t.kod kod,t.namekod namekod,t.kol kol,t.kodedi kodedi,t.edi edi,';
tx:=tx+' t.vetka vetka7,';
tx:=tx+' decode(instr(t.vetka,'';'',1,1),0,t.vetka,substr(t.vetka,1,instr(t.vetka,'';'',1,1)-1)) vetka1,';
tx:=tx+' decode(instr(t.vetka,'';'',1,2),0,'''',substr(t.vetka,instr(t.vetka,'';'',1,1)+1,instr(t.vetka,'';'',1,2)-instr(t.vetka,'';'',1,1)-1)) vetka2,';
tx:=tx+' decode(instr(t.vetka,'';'',1,3),0,'''',substr(t.vetka,instr(t.vetka,'';'',1,2)+1,instr(t.vetka,'';'',1,3)-instr(t.vetka,'';'',1,2)-1)) vetka3,';
tx:=tx+' decode(instr(t.vetka,'';'',1,4),0,'''',substr(t.vetka,instr(t.vetka,'';'',1,3)+1,instr(t.vetka,'';'',1,4)-instr(t.vetka,'';'',1,3)-1)) vetka4,';
tx:=tx+' decode(instr(t.vetka,'';'',1,5),0,'''',substr(t.vetka,instr(t.vetka,'';'',1,4)+1,instr(t.vetka,'';'',1,5)-instr(t.vetka,'';'',1,4)-1)) vetka5,';
tx:=tx+' decode(instr(t.vetka,'';'',1,6),0,'''',substr(t.vetka,instr(t.vetka,'';'',1,5)+1,instr(t.vetka,'';'',1,6)-instr(t.vetka,'';'',1,5)-1)) vetka6';
tx:=tx+' from (';

tx:=tx+' select pr.zavn zavn, pr.project proe, d.ident sp,spi.poz pozic,spi.podpoz podpoz,';
tx:=tx+' replace(replace(spi.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') namesp,';
tx:=tx+' s.kod kod,spi.kol kol,spi.kode kodedi,ed.namek edi,';
tx:=tx+' replace(replace(tronix.sp_name(spi.id_sprav),CHR(13)||CHR(10),'' ''),chr(39), '' '') namekod,';
tx:=tx+' replace(replace(replace(tronix.sp_zag_all(spi.nn,0),CHR(13)||CHR(10),'' ''),chr(39), '' '') ,'' ; '','';'') vetka';

tx:=tx+' from tronix.sp spi,tronix.sp spp,tronix.document d,tronix.sprav s,tronix.koded ed,tronix.project_list pr';

tx:=tx+' where spi.nnn=d.document_id(+) and d.id_project=pr.project_id and pr.project_id='+edit1.text;
tx:=tx+' and (spi.id_sprav=null or spi.id_sprav=s.sprav_id) and (spi.kode=null or spi.kode=ed.koded)';
tx:=tx+' and spi.up_nn=spp.nn and d.ident like (''%%360237%%'')';
tx:=tx+' ) t';
tx:=tx+' ) tt';
tx:=tx+' order by tt.sp,tt.vetka7,tt.pozic,tt.podpoz';

//ShowMessage(tx);
  With OraQuery1 Do
     begin
        FieldByName('zavn').DisplayLAbel:='«¿¬.π ';
        FieldByName('proe').DisplayLAbel:='œ–Œ≈ “ ';
        FieldByName('sp').DisplayLAbel:='—œ ';
        FieldByName('pozic').DisplayLAbel:='œŒ«»÷»ﬂ —œ ';
        FieldByName('podpoz').DisplayLAbel:='œŒƒœŒ«»÷.—œ ';
        FieldByName('namesp').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ —œ ';
        FieldByName('kod').DisplayLAbel:=' Œƒ ';
        FieldByName('namekod').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ ';
        FieldByName('kol').DisplayLAbel:=' ŒÀ»◊≈—“¬Œ ';
        FieldByName('kodedi').DisplayLAbel:=' Œƒ ≈ƒ.»«Ã. ';
        FieldByName('edi').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ ≈ƒ.»«Ã. ';
        FieldByName('vetka1').DisplayLAbel:='¬≈“ ¿ 1 ';
        FieldByName('vetka2').DisplayLAbel:='¬≈“ ¿ 2 ';
        FieldByName('vetka3').DisplayLAbel:='¬≈“ ¿ 3 ';
        FieldByName('vetka4').DisplayLAbel:='¬≈“ ¿ 4 ';
        FieldByName('vetka5').DisplayLAbel:='¬≈“ ¿ 5 ';
        FieldByName('vetka6').DisplayLAbel:='¬≈“ ¿ 6 ';
        FieldByName('vetka7').DisplayLAbel:='¬≈“ ¿ 7 ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

 end;


procedure TFVedom_snab_vetka_cfek.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFVedom_snab_vetka_cfek.Button1Click(Sender: TObject);
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

end.

