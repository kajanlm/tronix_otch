unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, StdCtrls, OleServer,
  ExcelXP,DBGridEhImpExp, GridsEh;

type
  TForm11 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    OraQuery1NOMER: TStringField;
    OraQuery1SUMA: TFloatField;
    OraQuery1SUMM1: TFloatField;
    OraQuery1DEP: TStringField;
    OraQuery1LEVEL: TFloatField;
    Button1: TButton;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    SaveDialog1: TSaveDialog;
    OraQuery1Delta: TFloatField;
    OraQuery1texkompl_comment: TStringField;
    OraQuery1Pdate_end: TStringField;
    OraQuery2: TOraQuery;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure OraQuery1CalcFields(DataSet: TDataSet);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses Unit10;

{$R *.dfm}

procedure TForm11.FormShow(Sender: TObject);
var tx: string;
begin
if Form10.Edit1.Text='' then
begin
tx:='            Select	LPAD('' '', (LEVEL - 1) * 2) ||  dwn.nomer Nomer ';
tx:=tx+'        , dwn.texkompl_id, nvl( dwn.trudoem, 0 ) trud_prostavl,  dwn.texkompl_comment, DECODE(dwn.pdate_end,null,NULL,dwn.otk_end) Pdate_end, ';
tx:=tx+'        (Select sum( nvl( ttnmat.trudoem, 0 ) )   ';
tx:=tx+'        from tronix.ttn ttn, tronix.ttn_mat ttnmat  ';
tx:=tx+'        where  dwn.texkompl_id=ttn.texkompl_texkompl_id_nar(+) ';
tx:=tx+'        and ttnmat.ttn_ttn_id(+)=ttn.ttn_id                      ';
tx:=tx+'        and ttn.user_date2 is not null                             ';
tx:=tx+'        and ttn.type_ttn_type_ttn_id=60                        ';
tx:=tx+'        )  SUMA,                                             ';
tx:=tx+'        (Select sum(nvl( tx.trudoem, 0 ) )                     ';
tx:=tx+'         from tx_texkompl	tx                                    ';
tx:=tx+'         connect by prior tx.texkompl_id = tx.texkompl_texkompl_ID ';
tx:=tx+'         start with  tx.texkompl_ID = dwn.texkompl_id            ';
tx:=tx+'         ) as summ1, ';
tx:=tx+'        (Select nomer from nordsy.dep where dep_id= dwn.dep_dep_id) as dep ';
tx:=tx+'                                      ,                               ';
tx:=tx+'        LEVEL                                                      ';
tx:=tx+'	          from	tx_texkompl	dwn                                  ';
//tx:=tx+'        where dwn.dep_dep_id=4043                                    ';
tx:=tx+'        connect by prior dwn.texkompl_id = dwn.texkompl_texkompl_ID  ';
tx:=tx+'       	start	with  dwn.texkompl_texkompl_ID = '+#39+Form10.Label1.Caption+#39;
tx:=tx+'        ORDER SIBLINGS BY dwn.nomer                                  ';
OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;
end;

if Form10.Edit1.Text<>'' then
begin
  OraQuery1.Fields.FieldByName('Suma').Calculated:=true;
  OraQuery1.Fields.FieldByName('Summ1').Calculated:=true;
    OraQuery1.Fields.FieldByName('DEP').Calculated:=true;
tx:=    ' Select	 nomer,Upper(dwn.texkompl_id) as texkompl_comment,0 summ1,0 suma,  level, 0 delta,DECODE(dwn.pdate_end,null,NULL,dwn.otk_end) Pdate_end   ';
tx:=tx+'  from	tx_texkompl dwn                  ';
tx:=tx+' where dwn.type_tex_type_tex_id=8        ';
tx:=tx+'        connect by prior dwn.texkompl_id = dwn.texkompl_texkompl_ID  ';
tx:=tx+'       	start	with  dwn.texkompl_texkompl_ID = '+#39+Form10.Label1.Caption+#39;
tx:=tx+'order by nomer                                                        ';
 OraQuery1.SQL.Text:=tx;
 OraQuery1.ExecSQL;

 // OraQuery1.Fields.FieldByName('Suma').SetFieldkind(fkcalculated);




end;
end;

procedure TForm11.Button1Click(Sender: TObject);
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
  //  ShowMessage(SaveDialog1.FileName);
  SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,SaveDialog1.FileName+'.xls',true);
  end;
end;
 end;



procedure TForm11.OraQuery1CalcFields(DataSet: TDataSet);
var tx:String;
begin
 if Form10.Edit1.Text<>'' then
begin
tx:='  Select sum(trudoem) summ1,sum(suma) suma, dep_dep_id as dep                                ';
tx:=tx+' from (                                                         ';
tx:=tx+' Select  tx.trudoem, tx.dep_dep_id, tx.texkompl_id,             ';
tx:=tx+'   (Select sum( nvl( ttnmat.trudoem, 0 ) )                      ';
tx:=tx+'   from tronix.ttn ttn, tronix.ttn_mat ttnmat                   ';
tx:=tx+'   where  texkompl_id=ttn.texkompl_texkompl_id_nar(+)           ';
tx:=tx+'   and ttnmat.ttn_ttn_id(+)=ttn.ttn_id                          ';
tx:=tx+'   and ttn.user_date2 is not null                               ';
tx:=tx+'   and ttn.type_ttn_type_ttn_id=60                              ';
tx:=tx+'        )  SUMA                                                 ';
tx:=tx+'  from	tx_texkompl tx                                          ';
tx:=tx+'   connect by prior tx.texkompl_id = tx.texkompl_texkompl_ID    ';
tx:=tx+'        	start	with  tx.texkompl_texkompl_ID = '+#39+oraQuery1.FieldByName('texkompl_comment').asstring+#39+')';
tx:=tx+' where dep_dep_id in (Select dep_id from nordsy.dep             ';
tx:=tx+' connect by prior dep_id=dep_dep_id                             ';
tx:=tx+' start with dep_id=(Select dep_id from nordsy.dep where nomer='+#39+Form10.Edit1.text+#39+'))';
tx:=tx+' group by dep_dep_id ';
  // ShowMessage(tx);
 OraQuery2.SQL.Text:=tx;
 OraQuery2.ExecSQL;
 oraQuery1.FieldByName('suma').value:=oraQuery2.FieldByName('Suma').asfloat ;
 oraQuery1.FieldByName('summ1').value:=oraQuery2.FieldByName('Summ1').asfloat ;
  oraQuery1.FieldByName('DEP').value:=oraQuery2.FieldByName('dep').asfloat ;

  end;





 if oraQuery1.FieldByName('Suma').asinteger>0 then
    oraQuery1.FieldByName('Delta').value:=oraQuery1.FieldByName('Summ1').asfloat-oraQuery1.FieldByName('Suma').asfloat;
end;

procedure TForm11.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
if Column.Field.DataSet.FieldByName('Delta').AsFloat>0 then background:=clred; 
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 oraQuery1.Close;
 if Form10.Edit1.Text<>'' then
 begin
    oraQuery2.Close;
       OraQuery1.Fields.FieldByName('Suma').Calculated:=false;
  OraQuery1.Fields.FieldByName('Summ1').Calculated:=false;
    OraQuery1.Fields.FieldByName('DEP').Calculated:=false;
 end;
end;

end.
