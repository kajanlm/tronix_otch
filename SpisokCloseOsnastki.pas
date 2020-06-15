unit SpisokCloseOsnastki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls;

type
  TFSpisokCloseOsnastki = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1zakaz: TStringField;
    OraQuery1nomer: TStringField;
    OraQuery1namepue: TStringField;
    OraQuery1podr: TStringField;
    OraQuery1datedok: TStringField;
    OraQuery1dateins: TStringField;
    OraQuery1vidr: TStringField;
    OraQuery1kol: TFloatField;
    OraQuery1namek: TStringField;
    OraQuery1trud: TFloatField;
    OraQuery1ch: TStringField;
    OraQuery1namech: TStringField;
    OraQuery1priznak: TStringField;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSpisokCloseOsnastki: TFSpisokCloseOsnastki;
dt:string;

implementation

uses Unit9;

{$R *.dfm}

procedure TFSpisokCloseOsnastki.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);
DateTimePicker1.DateTime:=date();
dt:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
end;

procedure TFSpisokCloseOsnastki.Button2Click(Sender: TObject);
var tx:string;
begin

tx:='select ll.zakaz zakaz,ll.nomer nomer,ll.namepue namepue,ll.podr podr,ll.datedok datedok,ll.dateins dateins,ll.vidr vidr,';
tx:=tx+' ll.kol kol,ll.namek namek,ll.trud trud,ll.ch ch,ll.namech namech,ll.priznak priznak';
tx:=tx+' from (';
tx:=tx+' select zk.zak zakaz,tk.nomer nomer, replace(replace(tk.name, CHR(13)||CHR(10),'' ''),chr(39), '' '') namepue,';
tx:=tx+' decode(dp.type_dep_type_dep_id,2,dp.nomer,dd.nomer) podr,';
tx:=tx+' to_char(tp.fl_end_beg,''DD.MM.YYYY'') datedok, to_char(tk.otk_end,''DD.MM.YYYY'') dateins,';
tx:=tx+' decode(instr(upper(trim(tp.name)),''–≈ÃŒÕ“'',-1),0,''ËÁ„ÓÚÓ‚ÎÂÌËÂ'',''ÂÏÓÌÚ'') vidr,';

tx:=tx+' tm.kol kol, ed.namek namek, tx_trud_tx(tk.texkompl_id) trud,';
tx:=tx+' decode(spp.typ_lov_typ_lov_id,null,'' '',(select name from tronix_typ_lov where typ_lov_id=spp.typ_lov_typ_lov_id)) ch,';
tx:=tx+' replace(replace(sp.name, CHR(13)||CHR(10),'' ''),chr(39), '' '') namech,';
tx:=tx+' decode(instr(upper(trim(tp.name)),''ŒƒÕŒ–¿«'',-1),0,''ÏÌÓ„Ó‡Á.'',''Ó‰ÌÓ‡Á.'') priznak ';

tx:=tx+' from nordsy.texkompl tk, nordsy.texkompl tp,nordsy.tx_mat tm, nordsy.texkompl tx,';
tx:=tx+' feb_zakaz zk, kadry_dep dp, kadry_dep dd, tronix_project_list pr,';
tx:=tx+' tronix.sprav sp, tronix.sprav spp, tronix.koded ed';

tx:=tx+' where tk.texkompl_texkompl_id=tx.texkompl_id(+) and tk.type_tex_type_tex_id=8 and tx.nomer=''“ÕŒ'' and tx.type_tex_type_tex_id=11';
tx:=tx+' and tx.project_project_id=pr.project_id(+)';
tx:=tx+' and pr.project_id=zk.id_project';

if edit1.text <> 'All' then
tx:=tx+' and zk.id_project='+edit1.text;

tx:=tx+' and substr(zk.zak,1,2) in (''16'',''41'') and tx_uzak_tx(tx.texkompl_id)=zk.nn';

tx:=tx+' and substr(trim(tk.nomer),1,instr(trim(tk.nomer),''_'',1)-1)=sp.kod';
tx:=tx+' and tp.texkompl_texkompl_id=tk.texkompl_id(+) and tp.type_tex_type_tex_id=14';
tx:=tx+' and ((upper(trim(tp.name)) like ''%%’–¿Õ≈Õ»≈%Œ—Õ¿—“ »%%ÃÕŒ√Œ–¿«Œ¬¿ﬂ%%'') or (upper(trim(tp.name)) like ''%%’–¿Õ≈Õ»≈%Œ—Õ¿—“ »%%ŒƒÕŒ–¿«Œ¬¿ﬂ%%''))';

tx:=tx+' and tm.tex_texkompl_id=tp.texkompl_id(+)';
tx:=tx+' and tk.otk_end is not null and TO_CHAR(tk.otk_end,''YYYYMM'')='+dt;

tx:=tx+' and tm.sprav_sprav_id=spp.sprav_id(+) and tm.koded_koded_id=ed.koded_id(+)';
tx:=tx+' and tp.dep_dep_id=dp.dep_id(+) and dp.dep_dep_id=dd.dep_id(+)';
tx:=tx+' ) ll';
tx:=tx+' order by ll.zakaz,ll.podr,ll.nomer';
//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('zakaz').DisplayLAbel:='«¿ ¿« ';
        FieldByName('nomer').DisplayLAbel:='ÕŒÃ≈– “  ';
        FieldByName('namepue').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ “  ';
        FieldByName('podr').DisplayLAbel:='Ã≈—“Œ ’–¿Õ≈Õ»ﬂ ';
        FieldByName('datedok').DisplayLAbel:='ƒ¿“¿ —Œ«ƒ. ';
        FieldByName('dateins').DisplayLAbel:='ƒ¿“¿ «¿ –. ';
        FieldByName('vidr').DisplayLAbel:='¬»ƒ –¿¡Œ“ ';
        FieldByName('kol').DisplayLAbel:=' ŒÀ-¬Œ ';
        FieldByName('namek').DisplayLAbel:='≈ƒ.»«Ã. ';
        FieldByName('trud').DisplayLAbel:='“–-“‹ ';
        FieldByName('ch').DisplayLAbel:='◊≈–“®∆';
        FieldByName('namech').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ ◊≈–“≈∆¿';
        FieldByName('priznak').DisplayLAbel:='“»œ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TFSpisokCloseOsnastki.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFSpisokCloseOsnastki.Button1Click(Sender: TObject);
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

procedure TFSpisokCloseOsnastki.DateTimePicker1Change(Sender: TObject);
begin
dt:=FormatDateTime('yyyymm',DateTimePicker1.DateTime);
end;

procedure TFSpisokCloseOsnastki.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

    if (Column.FieldName='kol') and (Column.Field.Dataset.FieldByName('kol').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='trud') and (Column.Field.Dataset.FieldByName('trud').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
