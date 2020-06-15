unit Pasport_Plant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls,DateUtils;

type
  TFPasport_Plant = class(TForm)
    DBGridEh1: TDBGridEh;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1podr: TStringField;
    OraQuery1priznak: TStringField;
    OraQuery1zak: TStringField;
    OraQuery1uzak: TStringField;
    OraQuery1kodprof: TStringField;
    OraQuery1prof: TStringField;
    OraQuery1trudoem: TFloatField;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPasport_Plant: TFPasport_Plant;
  dn: string;
  dk: string;
implementation

uses Unit32;

{$R *.dfm}

procedure TFPasport_Plant.FormShow(Sender: TObject);
var  Res: TDateTime;
begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='All';
Res:=StartOfTheYear(Now);
//ShowMessage(DateToStr(Res));
Res:=IncYear(Res,-1);
DateTimePicker1.DateTime:=Res;
Res:=EndOfTheYear(Res);
DateTimePicker2.DateTime:=Res;
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;

procedure TFPasport_Plant.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFPasport_Plant.Button1Click(Sender: TObject);
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

procedure TFPasport_Plant.Button2Click(Sender: TObject);
var tx:string;
begin

tx:=' ';
tx:='select tt.podr podr,tt.priznak priznak,tt.zak zak,tt.uzak uzak,substr(tt.kodprof,1,5) kodprof,tt.prof prof,sum(tt.trudoem) trudoem';
tx:=tx+' from (';
// tt
tx:=tx+' select de.nomer podr,''Ð'' priznak, pr.zavn zak, zk.zak uzak,kv.kod_prof kodprof, kv.name prof,tm.trudoem trudoem ';

tx:=tx+' from tronix.ttn tn, tronix.ttn_mat tm,tronix.zakaz zk,tronix_project_list pr,kadry_dep de,nordsy.kvalif kv';

tx:=tx+' where tn.type_ttn_type_ttn_id=60 and tm.ttn_ttn_id=tn.ttn_id';

//if Edit1.Text<>'All' then
tx:=tx+' and tn.dep_dep_id_to='+Edit1.Text;

tx:=tx+' and tm.kvalif_kvalif_id=kv.kvalif_id(+) and tn.post_post_id_nar is null';
tx:=tx+' and tn.uzak_uzak_id=zk.nn(+) and zk.id_project=pr.project_id(+)';
tx:=tx+' and tm.trudoem is not null and tn.date_anul_nar is null and tn.date_ins is not null';
tx:=tx+' and not exists ( select * from tronix.ttn tz where tz.zamen_nar = tn.ttn_id)';
tx:=tx+' and to_char(tn.date_ins,''YYYYMMDD'')>='+dn;
tx:=tx+' and to_char(tn.date_ins,''YYYYMMDD'')<='+dk;
tx:=tx+' and de.dep_id=tn.dep_dep_id_to';

tx:=tx+' union all';

tx:=tx+' select de.nomer podr,''Ï'' priznak,pr.zavn zak,zk.zak uzak,kv.kod_prof kodprof,kv.name prof,tm.trudoem trudoem';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.zakaz zk,tronix_project_list pr,kadry_dep de,nordsy.kvalif kv';

tx:=tx+' where tn.type_ttn_type_ttn_id=60 and tm.ttn_ttn_id=tn.ttn_id';

//if Edit1.Text<>'All' then
tx:=tx+' and tn.dep_dep_id_to='+Edit1.Text;

//tx:=tx+' and tn.dep_dep_id_to='+edit1.text;
tx:=tx+' and tm.kvalif_kvalif_id=kv.kvalif_id(+)';
tx:=tx+' and tn.uzak_uzak_id=zk.nn(+) and zk.id_project=pr.project_id(+)';
tx:=tx+' and tn.post_post_id_nar is not null';
tx:=tx+' and tm.trudoem is not null and tn.date_anul_nar is null and tn.date_ins is not null';
tx:=tx+' and not exists ( select * from tronix.ttn tz where tz.zamen_nar = tn.ttn_id)';
tx:=tx+' and to_char(tn.date_ins,''YYYYMMDD'')>='+dn;
tx:=tx+' and to_char(tn.date_ins,''YYYYMMDD'')<='+dk;
tx:=tx+' and de.dep_id=tn.dep_dep_id_to';
tx:=tx+' ) tt';
tx:=tx+' group by tt.podr,tt.priznak, tt.zak, tt.uzak,tt.kodprof,tt.prof';
tx:=tx+' order by tt.podr,tt.priznak,tt.zak,tt.uzak,tt.kodprof';

//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('podr').DisplayLAbel:='ÖÅÕ ';
        FieldByName('priznak').DisplayLAbel:='ÏÐÈÇÍÀÊ ';
        FieldByName('zak').DisplayLAbel:='ÇÀÂ.¹ ';
        FieldByName('uzak').DisplayLAbel:='Ó×.ÇÀÊÀÇ ';
        FieldByName('kodprof').DisplayLAbel:='ÊÎÄ ÏÐÎÔÅÑÑÈÈ ';
        FieldByName('prof').DisplayLAbel:='ÏÐÎÔÅÑÑÈß';
        FieldByName('trudoem').DisplayLAbel:='ÒÐ-ÒÜ ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

 end;

procedure TFPasport_Plant.DateTimePicker1Change(Sender: TObject);
begin
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
end;

procedure TFPasport_Plant.DateTimePicker2Change(Sender: TObject);
begin
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;

procedure TFPasport_Plant.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    if (Column.FieldName='trudoem') and (Column.Field.Dataset.FieldByName('trudoem').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

end.
