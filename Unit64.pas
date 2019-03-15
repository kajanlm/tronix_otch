unit Unit64;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls;

type
  TForm64 = class(TForm)
    DBGridEh1: TDBGridEh;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1zak: TStringField;
    OraQuery1txnomer: TStringField;
    OraQuery1razrjd: TStringField;
    OraQuery1tars: TStringField;
    OraQuery1trudoem: TFloatField;
    OraQuery1kodprof: TStringField;
    OraQuery1prof: TStringField;
    OraQuery1denomer: TStringField;
    OraQuery1tknomer: TStringField;
    OraQuery1tkname: TStringField;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
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
  Form64: TForm64;
implementation

uses Unit9;

{$R *.dfm}

procedure TForm64.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);

tx:=' ';
tx:='select z.zak zak,tx.nomer txnomer,to_char(tv.razpjd,''9'') razrjd,(vr.kod||yr.kod) tars,tv.time trudoem,';
tx:=tx+'kv.kod_prof kodprof,kv.name prof,de.nomer denomer,tk.nomer tknomer,tk.name tkname';

tx:=tx+' from nordsy.tex_kvalif tv,nordsy.kvalif kv,nordsy.texkompl tx,nordsy.texkompl tk,';
tx:=tx+' feb_zakaz z,nordsy.vid_rabot vr,nordsy.ysl_rabot yr,kadry_dep de,kadry_dep dd,tronix_project_list pr';

tx:=tx+' where tx.project_project_id=pr.project_id(+) and tv.texkompl_texkompl_id= tx.texkompl_id(+)';
tx:=tx+' and tv.kvalif_kvalif_id=kv.kvalif_id(+) and vid_rabot_vid_rabot_id=vr.vid_rabot_id(+)';
tx:=tx+' and ysl_rabot_ysl_rabot_id=yr.ysl_rabot_id(+) and tx.dep_dep_id=de.dep_id(+)';
tx:=tx+' and dd.dep_id='+edit2.text+' and (de.dep_dep_id=dd.dep_id or de.dep_id=dd.dep_id)';
//tx:=tx+' and dd.dep_id='+edit2.text+' and (de.dep_dep_id=dd.dep_id or de.dep_id=dd.nomer)';
tx:=tx+' and pr.project_id=z.id_project and z.id_project='+edit1.text;

tx:=tx+' and nordsy.uzak_tx(tx.texkompl_id)=z.nn';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.TEXkompl_TEXKOMPL_ID,''ÏÓÅ'',''TYPE''),tx.TEXkompl_TEXKOMPL_ID)=tk.texkompl_id';

tx:=tx+' order by tk.nomer,tx.nomer,kv.kod_prof,vr.kod,yr.kod';

//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('zak').DisplayLAbel:='ÇÀÂ.¹ ';
        FieldByName('txnomer').DisplayLAbel:='ÏÒÊ/ÖÅÕÎÊÎÎÏ ';
        FieldByName('razrjd').DisplayLAbel:='ÐÀÇÐßÄ ';
        FieldByName('tars').DisplayLAbel:='ÒÀÐ.ÑÅÒÊÀ ';
        FieldByName('trudoem').DisplayLAbel:='ÒÐÓÄÎ¨ÌÊÎÑÒÜ ';
        FieldByName('kodprof').DisplayLAbel:='ÊÎÄ ÏÐÎÔ. ';
        FieldByName('prof').DisplayLAbel:='ÏÐÎÔÅÑÑÈß ';
        FieldByName('denomer').DisplayLAbel:='ÖÅÕ ';
        FieldByName('tknomer').DisplayLAbel:='ÒÊ ';
        FieldByName('tkname').DisplayLAbel:='ÍÀÈÌÅÍÎÂÀÍÈÅ ÒÊ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

 end;

procedure TForm64.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TForm64.Button1Click(Sender: TObject);
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

procedure TForm64.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    if (Column.FieldName='trudoem') and (Column.Field.Dataset.FieldByName('trudoem').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
