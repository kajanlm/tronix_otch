unit Primen_PUE_in_dok_dvig_naryd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComCtrls,ComObj;

type
  TFPrimen_PUE_in_dok_dvig_naryd = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1tknomer: TStringField;
    OraQuery1tkname: TStringField;
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
 private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrimen_PUE_in_dok_dvig_naryd: TFPrimen_PUE_in_dok_dvig_naryd;
implementation

uses Unit9,Primen_PUE_in_dok_dvig_naryd_open;

{$R *.dfm}

procedure TFPrimen_PUE_in_dok_dvig_naryd.FormShow(Sender: TObject);
var tx: string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//ShowMessage(Edit2.Text);

//OraQuery1.Close;

tx:='';
tx:='select tk.nomer as tknomer,replace(replace(tk.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') tkname';
tx:=tx+' from nordsy.texkompl tk';

tx:=tx+' where tk.type_tex_type_tex_id in (7,8)';
tx:=tx+' and tk.project_project_id='+edit1.text;
tx:=tx+' order by tk.nomer'; 
//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('tknomer').DisplayLAbel:='“ /“Õ ';
        FieldByName('tkname').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ “ /“Õ ';
      end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;
  end;



procedure TFPrimen_PUE_in_dok_dvig_naryd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close;
end;


procedure TFPrimen_PUE_in_dok_dvig_naryd.Button1Click(Sender: TObject);
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
procedure TFPrimen_PUE_in_dok_dvig_naryd.DBGridEh1DblClick(Sender: TObject);
begin
  Application.CreateForm(TFPrimen_PUE_in_dok_dvig_naryd_open, FPrimen_PUE_in_dok_dvig_naryd_open);
  FPrimen_PUE_in_dok_dvig_naryd_open.Edit1.Text:=Edit1.Text;
  FPrimen_PUE_in_dok_dvig_naryd_open.Edit2.Text:=Edit2.text;
  FPrimen_PUE_in_dok_dvig_naryd_open.Edit3.Text:=oraQuery1.FieldByName('tknomer').asString;
  FPrimen_PUE_in_dok_dvig_naryd_open.Caption:='œÓÂÍÚ: '+Edit2.text+'   “ /“Õ: '+oraQuery1.FieldByName('tknomer').asString;
  FPrimen_PUE_in_dok_dvig_naryd_open.ShowModal();
  FPrimen_PUE_in_dok_dvig_naryd_open.Free;
end;

end.
