unit Unit68;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TForm68 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1kod: TStringField;
    OraQuery1sname: TStringField;
    OraQuery1nomertx: TStringField;
    OraQuery1kodm: TStringField;
    OraQuery1ch: TStringField;
    OraQuery1kol: TFloatField;
    OraQuery1namek: TStringField;
    OraQuery1ssname: TStringField;
    OraQuery1txname: TStringField;
    OraQuery1spkol: TStringField;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form68: TForm68;

implementation

//uses unit67;

{$R *.dfm}

procedure TForm68.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);

tx:=' ';
tx:=tx+'select l.kod as kod,l.sname as sname,l.nomertx as nomertx,l.kodm as kodm,';
tx:=tx+' (select ty.name from tronix.sprav s,tronix.typ_lov ty where s.kod=l.kodm and s.typ_lov_typ_lov_id=ty.typ_lov_id(+)) as ch,';
tx:=tx+' l.kol as kol, l.namek as namek,';
tx:=tx+' replace(tronix.sp_name((select sprav_id from tronix_sprav where kod=l.kodm)), chr(10), '' '') as ssname,';
tx:=tx+' l.txname as txname,';
tx:=tx+' tronix.sp_poz_koli((select s.sprav_id from tronix.sprav s where s.kod=l.kodm), l.projid) as spkol';
tx:=tx+' from';
tx:=tx+' (';
tx:=tx+' select ll.kod kod,';

tx:=tx+' ll.nomertx nomertx,';

tx:=tx+' (substr(ll.nomer,length(ll.nomertx)+2,instr(trim(ll.nomer),''/'',length(ll.nomertx)+2,1)-length(ll.nomertx)-2)) kodm,';

tx:=tx+' decode(ll.namek,''ÿ“.'',round(nvl(ll.kol,0),0),'' -“'',round(nvl(ll.kol,0),0),round(nvl(ll.kol,0),4)) kol,';

tx:=tx+' ll.namek namek,replace(tronix.sp_name(ll.idsp), chr(10), '' '') as sname,ll.txname txname,ll.idsp idsp,ll.projid projid';

tx:=tx+' from (';

tx:=tx+' select tx.nomer nomer,s.kod kod,s.sprav_id idsp,po.project_project_id projid,';

tx:=tx+' max((Select tk.nomer from nordsy.texkompl tk where tk.texkompl_id=nordsy.GET_UP_TTN(tx.texkompl_id,8))) nomertx,';

tx:=tx+' sum(nvl(po.kol,0)) kol, ed.namek namek, tx.name txname,z.zak zak';


tx:=tx+' from nordsy.car_potr po,nordsy.texkompl tx,tronix.koded ed,tronix.sprav s,feb_zakaz z';

tx:=tx+' where po.texkompl_texkompl_id=tx.texkompl_id and po.sprav_sprav_id=s.sprav_id';

if Edit2.Text <> 'All' then
tx:=tx+' and s.kod='''+edit2.text+'''';

tx:=tx+' and tronix.select_mat(s.tree_tree_id,''02'')=1 and nvl(s.l_ogran,0)=1 and nvl(s.can_do_self,0)=0 and nvl(s.rossip,0)=0';

tx:=tx+' and po.koded_koded_id=ed.koded_id';

tx:=tx+' and po.project_project_id=z.id_project and po.uzak_uzak_id=z.nn and z.id_project='+edit1.text;
tx:=tx+' and upper(z.zak) like (''%%Ã—◊%%'')';
tx:=tx+' group by po.project_project_id,s.kod ,tx.nomer,tx.texkompl_id,s.sprav_id,ed.namek,tx.name';
tx:=tx+' ) ll';
tx:=tx+' ) l';
tx:=tx+' order by l.kod,l.kodm,l.nomertx';

//ShowMEssage(tx);

  With OraQuery1 Do
     begin
        FieldByName('kod').DisplayLAbel:=' Œƒ œŒ ”œ.»«ƒ-»ﬂ';
        FieldByName('sname').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ œŒ ”œÕŒ√Œ »«ƒ≈À»ﬂ';
        FieldByName('nomertx').DisplayLAbel:='TH ';
        FieldByName('kodm').DisplayLAbel:=' Œƒ Ã—◊';
        FieldByName('ch').DisplayLAbel:='◊≈–“®∆ ';
        FieldByName('kol').DisplayLAbel:=' ŒÀ-¬Œ ';
        FieldByName('namek').DisplayLAbel:='≈ƒ.»«Ã. ';
        FieldByName('ssname').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ »«ƒ≈À»ﬂ Ã—◊';
        FieldByName('txname').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ “Õ ';
        FieldByName('spkol').DisplayLAbel:='œŒ«»÷»» »  ŒÀ»◊≈—“¬¿ œŒ —œ≈÷»‘» ¿÷»» ';
    end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TForm68.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TForm68.Button1Click(Sender: TObject);
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


procedure TForm68.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    if (Column.FieldName='kol') and (Column.Field.Dataset.FieldByName('kol').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
