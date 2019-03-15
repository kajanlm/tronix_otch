unit Unit60;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TForm60 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1ident: TStringField;
    OraQuery1poz: TStringField;
    OraQuery1podpoz: TStringField;
    OraQuery1name: TStringField;
    OraQuery1kod: TStringField;
    OraQuery1kol: TFloatField;
    OraQuery1namek: TStringField;
    OraQuery1namekod: TStringField;
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
  Form60: TForm60;

implementation

uses Unit9;

{$R *.dfm}

procedure TForm60.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);

tx:='Select d.ident ident,sp.poz poz, sp.podpoz podpoz,replace(replace(sp.name, CHR(13)||CHR(10),'' ''),chr(39), '' '') name,';
tx:=tx+' s.kod kod,sp.kol kol,kd.namek namek,';
tx:=tx+' replace(replace(tronix_sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') namekod';

tx:=tx+' from  tronix.sp sp, tronix.project_list pr, tronix.document d, tronix.sprav s,';
tx:=tx+' tronix.koded kd, tronix.document_type dt ';

tx:=tx+' where d.document_id=sp.nnn  and d.id_project=pr.project_id(+) ';
tx:=tx+' and pr.project_id='+edit1.text;
tx:=tx+' and sp.id_sprav=s.sprav_id';
tx:=tx+' and d.id_document_type=dt.document_type_id';
tx:=tx+' and dt.document_type_id in (18,20)';
//tx:=tx+' and d.id_document_group=dg.document_group_id';
tx:=tx+' and d.ident like ''%%360237%%'' and kd.koded=sp.kode';
tx:=tx+' order by d.ident,sp.poz,sp.podpoz';

//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('ident').DisplayLAbel:='ÑÏ ';
        FieldByName('poz').DisplayLAbel:='ÏÎÇÈÖÈß ';
        FieldByName('podpoz').DisplayLAbel:='ÏÎÄÏÎÇÈÖÈß ';
        FieldByName('name').DisplayLAbel:='ÍÀÈÌÅÍÎÂÀÍÈÅ ÑÏ ';
        FieldByName('kod').DisplayLAbel:='ÊÎÄ ';
        FieldByName('kol').DisplayLAbel:='ÊÎËÈ×ÅÑÒÂÎ ';
        FieldByName('namek').DisplayLAbel:='ÅÄ.ÈÇÌ. ';
        FieldByName('namekod').DisplayLAbel:='ÍÀÈÌÅÍÎÂÀÍÈÅ ÌÀÒÅÐÈÀËÀ/ÎÁÎÐÓÄÎÂÀÍÈß';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TForm60.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TForm60.Button1Click(Sender: TObject);
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


procedure TForm60.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

    if (Column.FieldName='kol') and (Column.Field.Dataset.FieldByName('kol').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
end.
