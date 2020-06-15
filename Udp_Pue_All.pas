unit Udp_Pue_All;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TFUdp_Pue_All = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1udp: TStringField;
    OraQuery1tk: TStringField;
    OraQuery1tkdatotk: TStringField;
    OraQuery1tx: TStringField;
    OraQuery1txdatotk: TStringField;
    OraQuery1trnorm: TFloatField;
    OraQuery1trzakr: TFloatField;
    OraQuery1trost: TFloatField;
    OraQuery1procent: TFloatField;
    OraQuery1zavn: TStringField;
    OraQuery1zak: TStringField;
    OraQuery1proekt: TStringField;
    OraQuery1abrudp: TStringField;
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
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
 private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUdp_Pue_All: TFUdp_Pue_All;

implementation

 uses Udp_Norma_Fakt_Ostatok,Udp_PUE_All_Cex;

{$R *.dfm}

procedure TFUdp_Pue_All.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);

tx:=' ';
tx:=tx+' select substr(ll.udp,1,254) as udp,ll.tk as tk,ll.tkdatotk as tkdatotk,ll.tx as tx,ll.txdatotk as txdatotk,';
tx:=tx+' ll.trnorm as trnorm,ll.trzakr as trzakr,ll.trost as trost,(decode(ll.trzakr,0,0,round((ll.trzakr/ll.trnorm)*100,2))) as procent,';
tx:=tx+' ll.zavn as zavn,ll.zak as zak,ll.proekt as proekt,ll.abrudp as abrudp';
tx:=tx+' from(';

tx:=tx+' select l.txdic udp,l.abrudp abrudp,nordsy.tx_nomer(l.tkid) tk,TO_CHAR(l.tkdatotk,''DD.MM.YYYY'') tkdatotk,';
tx:=tx+' nordsy.tx_nomer(l.txid) tx,TO_CHAR(nordsy.get_date_tx_from_ptx(l.txid,''OTK_END''),''DD.MM.YYYY'') txdatotk,';
tx:=tx+' l.zavn zavn,l.zak zak,l.proekt proekt,';

tx:=tx+' nordsy.trud_tx_reg_dat.trud_tx(l.txid) trnorm,';
tx:=tx+' (nordsy.trud_tx_reg_dat.trud_tx(l.txid)-nordsy.trud_tx_reg_dat.trud_tx(l.txid,''Œ—“¿“Œ '')) trzakr,';
tx:=tx+' nordsy.trud_tx_reg_dat.trud_tx(l.txid,''Œ—“¿“Œ '') trost';
tx:=tx+' from(';

tx:=tx+' select distinct trim(tronix.up_tk_dic(tx.texkompl_id)) txdic,tronix.up_tk_dic_short(tx.texkompl_id) abrudp,tk.texkompl_id tkid,';
tx:=tx+' nordsy.get_date_tx_from_ptx(tk.texkompl_id,''OTK_END'') tkdatotk,pr.name proekt,pr.zavn zavn,zk.zak zak,';

tx:=tx+' decode(tx.type_tex_type_tex_id,7,tx.texkompl_id,8,tx.texkompl_id,';
tx:=tx+'(select tv.texkompl_id from nordsy.texkompl tv where tv.type_tex_type_tex_id not in (11,13) and tv.texkompl_texkompl_id=tk.texkompl_id';
tx:=tx+' start with tv.texkompl_id =tx.texkompl_id';
tx:=tx+' connect  by prior tv.texkompl_texkompl_id=tv.texkompl_id)) as txid';

tx:=tx+' from nordsy.tex_kvalif tv,nordsy.texkompl tx,nordsy.texkompl tk,feb_zakaz zk,tronix.project_list pr';

tx:=tx+' where tv.texkompl_texkompl_id=tx.texkompl_id(+) and tx.project_project_id='+edit1.text;
tx:=tx+' and pr.project_id=tx.project_project_id';
tx:=tx+' and nordsy.uzak_tx(tx.texkompl_id)=zk.nn and upper(zk.zak) not like (''%%(Ã—◊)'')';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.texkompl_id,''œ”≈'',''TYPE''),tx.texkompl_id)=tk.texkompl_id(+)';

if edit2.text <> 'All' then
begin
//form71.DBGridEh1.columns.udp.visible:=false;
tx:=tx+' and trim(tronix.up_tk_dic_short(tx.texkompl_id))='''+edit2.text;
tx:=tx+'''';
end;

tx:=tx+' )l';
tx:=tx+' )ll';
tx:=tx+' order by nordsy.sort_char_number(ll.abrudp), ll.tk,ll.tx';

//ShowMEssage(tx);

  With OraQuery1 Do
     begin
        FieldByName('udp').DisplayLAbel:='”ƒœ';
        FieldByName('tk').DisplayLAbel:=' “ ';
        FieldByName('tkdatotk').DisplayLAbel:='ƒ¿“¿ Œ“◊®“¿ “ ';
        FieldByName('tx').DisplayLAbel:=' œ“ ';
        FieldByName('txdatotk').DisplayLAbel:='ƒ¿“¿ Œ“◊®“¿ œ“ ';
        FieldByName('trnorm').DisplayLAbel:='“–-“‹ ÕŒ–Ã. œ“ ';
        FieldByName('trzakr').DisplayLAbel:='“–-“‹ ‘¿ “. œ“ ';
        FieldByName('trost').DisplayLAbel:='“–-“‹ Œ—“. œ“ ';
        FieldByName('procent').DisplayLAbel:='%  ';
        FieldByName('zavn').DisplayLAbel:='«¿¬.ÕŒÃ≈– ';
        FieldByName('zak').DisplayLAbel:='«¿ ¿« ';
        FieldByName('proekt').DisplayLAbel:='œ–Œ≈ “ ';
        FieldByName('abrudp').DisplayLAbel:=' Œ–Œ“ Œ≈ ”ƒœ ';
    end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TFUdp_Pue_All.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFUdp_Pue_All.Button1Click(Sender: TObject);
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

 procedure TFUdp_Pue_All.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
     if (Column.FieldName='trnorm') and (Column.Field.Dataset.FieldByName('trnorm').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='trzakr') and (Column.Field.Dataset.FieldByName('trzakr').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='trost') and (Column.Field.Dataset.FieldByName('trost').AsFloat > 0) then
   TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

end;

procedure TFUdp_Pue_All.Button2Click(Sender: TObject);
begin
   Application.CreateForm(TFUdp_Pue_All_Cex, FUdp_Pue_All_Cex);
  FUdp_Pue_All_Cex.Edit1.Text:=FUdp_Pue_All.Edit1.Text;
  FUdp_Pue_All_Cex.Edit2.Text:='All';
//  Form71.Edit3.Text:=Form9.oraQuery1.FieldByName('name').asString;
  FUdp_Pue_All_Cex.Caption:=FUdp_Pue_All.Caption;
  FUdp_Pue_All_Cex.ShowModal();
  FUdp_Pue_All_Cex.Free;
 end;


end.

