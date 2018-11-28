unit Unit55;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TForm55 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1kod: TStringField;
    OraQuery1name: TStringField;
    OraQuery1namek: TStringField;
    OraQuery1kolp: TFloatField;
    OraQuery1kol: TFloatField;
    OraQuery1koli: TFloatField;
    OraQuery1kols: TFloatField;
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
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form55: TForm55;

implementation

uses Unit9,Unit56;

{$R *.dfm}

procedure TForm55.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);

tx:='select ll.kod kod,ll.name name,ll.namek,ll.idsprav,';
tx:=tx+' decode(ll.namek,''ÿ“'',round(ll.kolp,0),round(ll.kolp,1)) kolp,';
tx:=tx+' decode(ll.namek,''ÿ“'',round(ll.kol,0),round(ll.kol,1)) kol,';
tx:=tx+' decode(ll.namek,''ÿ“'',round(ll.koli,0),round(ll.koli,1)) koli,';
tx:=tx+' decode(ll.namek,''ÿ“'',round(ll.kols,0),round(ll.kols,1)) kols';
tx:=tx+' from (';

tx:=tx+'select l.kod kod,l.name name,sum(l.kol) kol,l.namek namek,l.spravid idsprav,';
tx:=tx+'(round(nordsy.get_msc_work(''POTR'',l.spravid,l.projectid,l.kodedid),1)) kolp,';
tx:=tx+'(round(nordsy.get_msc_work(''WORK'',l.spravid,l.projectid,l.kodedid),1)) koli,';
tx:=tx+'(round(nordsy.get_msc_work(''VYD'',l.spravid,l.projectid,l.kodedid),1)) kols';
tx:=tx+' from ( ';

tx:=tx+'Select tm.kol kol,';
//tx:=tx+'(Select nomer from tx_texkompl where texkompl_id=tex_texkompl_id) nomer,';
tx:=tx+'(Select kod from tronix.sprav where sprav_id=sprav_sprav_id) kod,';
tx:=tx+'tm.sprav_sprav_id spravid,tm.koded_koded_id kodedid,tx.project_project_id projectid,';
tx:=tx+'kd.namek namek,tronix.sp_name(tm.sprav_sprav_id) name';

tx:=tx+' from nordsy.tx_mat tm, nordsy.texkompl tx, tronix.koded kd, feb_zakaz z';
tx:=tx+' where type_relation_type_relation_id=9';
tx:=tx+' and tm.tex_texkompl_id=tx.texkompl_id(+)';
tx:=tx+' and tm.koded_koded_id=kd.koded_id';
tx:=tx+' and tx.project_project_id='+edit1.text;
tx:=tx+' and nordsy.uzak_tx(tx.texkompl_id)=z.nn';
tx:=tx+' and upper(z.zak) like (''%Ã—◊%'')';
//tx:=tx+' and rownum<5';
tx:=tx+' order by kod';
tx:=tx+' ) l';
tx:=tx+' group by l.kod,l.name,l.namek,l.spravid,round(nordsy.get_msc_work(''POTR'',l.spravid,l.projectid,l.kodedid),1),';
tx:=tx+' round(nordsy.get_msc_work(''WORK'',l.spravid,l.projectid,l.kodedid),1),';
tx:=tx+' round(nordsy.get_msc_work(''VYD'',l.spravid,l.projectid,l.kodedid),1)';
//tx:=tx+' order by l.kod';
tx:=tx+' ) ll';

//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('kod').DisplayLAbel:=' Œƒ ';
        FieldByName('name').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ ';
        FieldByName('namek').DisplayLAbel:='≈ƒ.»«Ã. ';
        FieldByName('kolp').DisplayLAbel:='œŒ“–≈¡ÕŒ—“‹ œŒ —œ ';
        FieldByName('kol').DisplayLAbel:='»«√Œ“Œ¬»“‹ œŒ “Õ ';
        FieldByName('koli').DisplayLAbel:='»«√Œ“Œ¬À≈ÕŒ';
        FieldByName('kols').DisplayLAbel:='¬€ƒ¿ÕŒ';
        FieldByName('idsprav').DisplayLAbel:='idsprav';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TForm55.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TForm55.Button1Click(Sender: TObject);
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

procedure TForm55.DBGridEh1DblClick(Sender: TObject);
begin
  Form55.edit2.Text:=oraQuery1.FieldByName('idsprav').asString;
//  ShowMessage(Form55.edit2.Text);
//  ShowMessage(Form55.edit1.Text);
  Application.CreateForm(TForm56, Form56);
  Form56.Edit1.Text:=Form55.Edit1.Text;
//  ShowMessage(Form56.Edit1.Text);
  Form56.Edit2.Text:=Form55.Edit2.Text;
  Form56.Edit3.Text:=oraQuery1.FieldByName('namek').asString;
    Form56.Caption:=' ÓÎË˜ÂÒÚ‚Ó ËÁ‰ÂÎËÈ Ã—◊ ÔÓ: '+Form9.oraQuery1.FieldByName('name').asString;
//  if  Form55.EDIT2.TEXT<>'All' then
 Form56.Caption:=Form56.Caption+'   Œƒ='+oraQuery1.FieldByName('kod').asString+'  '+oraQuery1.FieldByName('name').asString;
  Form56.ShowModal();
  Form56.Free;
end;

procedure TForm55.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
      if (Column.FieldName='kolp') and (Column.Field.Dataset.FieldByName('kolp').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='kol') and (Column.Field.Dataset.FieldByName('kol').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='koli') and (Column.Field.Dataset.FieldByName('koli').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='kols') and (Column.Field.Dataset.FieldByName('kols').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
end.
