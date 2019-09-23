unit Unit77;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComObj;

type
  TForm77 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1udp: TStringField;
    OraQuery1tk: TStringField;
    OraQuery1tkname: TStringField;
    OraQuery1dep: TStringField;
    OraQuery1ptk: TStringField;
    OraQuery1ptkname: TStringField;
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
  Form77: TForm77;

implementation
uses Unit76,Unit70,Unit9;


{$R *.dfm}

procedure TForm77.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);

tx:=' ';
tx:=tx+'select ll.udp as udp,ll.tk as tk,ll.tkname as tkname,ll.dep as dep,ll.ptk as ptk,ll.ptkname as ptkname';
tx:=tx+' from( ';
tx:=tx+' select tronix_up_tk_dic(tx.texkompl_id) udp,tk.nomer tk,tk.name tkname,de.nomer dep,tx.nomer ptk,tx.name ptkname';
tx:=tx+' from nordsy.texkompl tx,nordsy.texkompl tk,kadry_dep de,feb_zakaz zk,tronix.project_list pr';   
tx:=tx+' where tx.project_project_id='+edit1.text;
tx:=tx+' and pr.project_id=tx.project_project_id';  
tx:=tx+' and nordsy.uzak_tx(tx.texkompl_id)=zk.nn and upper(zk.zak) not like (''%%(Ã—◊)'')';
tx:=tx+' and tx.type_tex_type_tex_id not in (11,13)';
tx:=tx+' and not exists (select * from nordsy.texkompl tt where tt.texkompl_texkompl_id=tx.texkompl_id)';
tx:=tx+' and not exists (select * from nordsy.tex_kvalif tv where tv.texkompl_texkompl_id=tx.texkompl_id)';
tx:=tx+' and tronix_up_tk_dic_short(tx.texkompl_id) is not null';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.texkompl_id,''œ”≈'',''TYPE''),tx.texkompl_id)=tk.texkompl_id(+)';
tx:=tx+' and tk.dep_dep_id=de.dep_id(+)';
tx:=tx+' ) ll';
tx:=tx+' order by nordsy.sort_char_number(ll.udp)';
//ShowMEssage(tx);

  With OraQuery1 Do
     begin
        FieldByName('udp').DisplayLAbel:='”ƒœ';
        FieldByName('tk').DisplayLAbel:='“ ';
        FieldByName('tkname').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ “ ';
        FieldByName('dep').DisplayLAbel:='÷≈’';
        FieldByName('ptk').DisplayLAbel:='œ“ ';
        FieldByName('ptkname').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ œ“ ';
    end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TForm77.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TForm77.Button1Click(Sender: TObject);
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
