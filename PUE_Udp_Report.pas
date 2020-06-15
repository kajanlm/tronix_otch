unit PUE_Udp_Report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TFPUE_Udp_Report = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1tknomer: TStringField;
    OraQuery1tkdat: TStringField;
    OraQuery1tkup: TStringField;
    OraQuery1txnomer: TStringField;
    OraQuery1txdat: TStringField;
    OraQuery1txup: TStringField;
    OraQuery1tkname: TStringField;
    OraQuery1txname: TStringField;
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
 private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPUE_Udp_Report: TFPUE_Udp_Report;

implementation



{$R *.dfm}

procedure TFPUE_Udp_Report.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);

tx:=' ';
tx:=tx+'select t.tknomer as tknomer,t.tkdat as tkdat,t.tkup as tkup,t.txnomer as txnomer,t.txdat as txdat,t.txup as txup,t.tkname as tkname,t.txname as txname';
tx:=tx+' from';
tx:=tx+' (';
tx:=tx+' select tk.nomer tknomer,to_char(tk.otk_end,''DD.MM.YYYY'') tkdat,tx.nomer txnomer,to_char(tx.otk_end,''DD.MM.YYYY'') txdat,';
tx:=tx+' replace(tx.name, chr(10), '' '') txname,replace(tk.name, chr(10), '' '') tkname,';
tx:=tx+'tx.texkompl_id txid,tronix.up_tk_dic(tk.texkompl_id) tkup,tronix.up_tk_dic(tx.texkompl_id) txup';

tx:=tx+' from tronix_project_list pr,feb_zakaz z,nordsy.texkompl tx,nordsy.texkompl tk';

tx:=tx+' where tx_uzak_tx(tx.texkompl_id)=z.nn and tx.project_project_id=pr.project_id';
tx:=tx+' and pr.project_id=z.id_project and z.id_project='+Edit1.Text;
tx:=tx+' and upper(z.zak) not like (''%%ляв%'')';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.TEXkompl_TEXKOMPL_ID,''осе'',''TYPE''),tx.TEXkompl_TEXKOMPL_ID)=tk.texkompl_id';
tx:=tx+' ) t';
tx:=tx+' order by t.tknomer,t.txnomer';

//ShowMEssage(tx);

  With OraQuery1 Do
     begin
        FieldByName('tknomer').DisplayLAbel:='осе1';
        FieldByName('tkdat').DisplayLAbel:='дюрю нрв╗рю осе1';
        FieldByName('tkup').DisplayLAbel:='сдо осе1';
        FieldByName('txnomer').DisplayLAbel:='осе2';
        FieldByName('txdat').DisplayLAbel:='дюрю нрв╗рю осе2';
        FieldByName('txup').DisplayLAbel:='сдо осе2 ';
        FieldByName('tkname').DisplayLAbel:='мюхлемнбюмхе осе1 ';
        FieldByName('txname').DisplayLAbel:='мюхлемнбюмхе осе2';
    end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TFPUE_Udp_Report.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFPUE_Udp_Report.Button1Click(Sender: TObject);
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
