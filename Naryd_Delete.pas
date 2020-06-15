unit Naryd_Delete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComCtrls;

type
  TFNaryd_Delete = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1cex: TStringField;
    OraQuery1nomnar: TStringField;
    OraQuery1zak: TStringField;
    OraQuery1godu: TStringField;
    OraQuery1dayu: TStringField;
    OraQuery1mesu: TStringField;
    OraQuery1vremu: TStringField;
    OraQuery1avtoru: TStringField;
    OraQuery1godi: TStringField;
    OraQuery1dayi: TStringField;
    OraQuery1mesi: TStringField;
    OraQuery1vremi: TStringField;
    OraQuery1avtori: TStringField;
    OraQuery1proekt: TStringField;
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
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Button2: TButton;
    DateTimePicker2: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
 private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNaryd_Delete: TFNaryd_Delete;
  dn: string;
  dk: string;

implementation
uses Unit32;


{$R *.dfm}

procedure TFNaryd_Delete.FormShow(Sender: TObject);
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);
DateTimePicker1.DateTime:=date();
DateTimePicker2.DateTime:=date();
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;

procedure TFNaryd_Delete.Button2Click(Sender: TObject);
var tx:string;
begin
tx:=' ';
tx:=tx+'select ll.cex as cex,ll.nomnar as nomnar,ll.zak as zak,ll.godu as godu,ll.mesu as mesu,ll.dayu as dayu,ll.vremu as vremu,ll.avtoru as avtoru,';
tx:=tx+' ll.godi as godi,ll.mesi as mesi,ll.dayi as dayi,ll.vremi as vremi,ll.avtori as avtori,ll.proekt as proekt';
tx:=tx+' from (';

tx:=tx+' select l.idnar idnar,l.nomnar nomnar,l.avtori avtori,l.avtoru avtoru,';
tx:=tx+' (select de.nomer from kadry_dep de where de.dep_id=l.idcex) cex,';
tx:=tx+' (select z.zak from feb_zakaz z where z.nn=l.zak) zak,';

tx:=tx+' substr(l.dati,1,4) godi,substr(l.dati,6,2) mesi,substr(l.dati,9,2) dayi,substr(l.dati,12,8) vremi,';
tx:=tx+' substr(l.datu,1,4) godu,substr(l.datu,6,2) mesu,substr(l.datu,9,2) dayu,substr(l.datu,12,8) vremu,';

tx:=tx+' (select pr.name from feb_zakaz z,tronix.project_list pr where z.nn=l.zak and pr.project_id=z.id_project) proekt';
tx:=tx+' from (';
tx:=tx+' select iz.id idnar,substr(iz.key,9,instr(iz.key,''#'',1,3)-9) nomnar,t.idcex idcex,t.avtori avtori,t.dati dati,';
tx:=tx+' substr(iz.key,instr(iz.key,''#'',1,4)+3,length(iz.key)-instr(iz.key,''#'',1,4)+3) zak,to_char(iz.dat,''YYYY.MM.DD HH24:MI:SS'') datu,iz.fio avtoru';

tx:=tx+' from tronix.izm iz,';
tx:=tx+' (select iz.id idnar,substr(iz.key,9,instr(iz.key,''#'',1,3)-9) nomnar,substr(iz.key,instr(iz.key,''#'',1,5)+4,4) idcex,';
tx:=tx+' iz.fio avtori,to_char(iz.dat,''YYYY.MM.DD HH24:MI:SS'') dati';
tx:=tx+' from tronix.izm iz where iz.tname in (''TTN'') and substr(iz.key,1,6)=''#T:60#'' and iz.izm=''I'') t';

tx:=tx+' where iz.tname in (''TTN'') and substr(key,1,6)=''#T:60#'' and iz.izm=''D''and t.idnar=iz.id';
//tx:=tx+' and substr(to_char(iz.dat,''YYYYMMDD''),1,4)=2019';
tx:=tx+' and to_char(iz.dat,''YYYYMMDD'') >='+DN;
tx:=tx+' and to_char(iz.dat,''YYYYMMDD'') <='+DK;
if Edit1.Text<>'All' then
tx:=tx+' and t.idcex='''+Edit1.Text+'''';
tx:=tx+' ) l';
tx:=tx+' )ll';
tx:=tx+' order by ll.cex,ll.nomnar,ll.godu,ll.mesu,ll.dayu';
//ShowMEssage(tx);

  With OraQuery1 Do
     begin
        FieldByName('cex').DisplayLAbel:='жеу';
        FieldByName('nomnar').DisplayLAbel:='мнлеп мюпъдю';
        FieldByName('zak').DisplayLAbel:='гюб.╧';
        FieldByName('godu').DisplayLAbel:=' цнд сдюк.';
        FieldByName('mesu').DisplayLAbel:=' леяъж сдюк.';
        FieldByName('dayu').DisplayLAbel:=' демэ сдюк.';
        FieldByName('vremu').DisplayLAbel:='бпелъ сдюк.';
        FieldByName('avtoru').DisplayLAbel:='сдюкхк';
        FieldByName('godi').DisplayLAbel:='цнд янгд.';
        FieldByName('mesi').DisplayLAbel:='леяъж янгд.';
        FieldByName('dayi').DisplayLAbel:=' демэ янгд.';
        FieldByName('vremi').DisplayLAbel:='бпелъ янгд.';
        FieldByName('avtori').DisplayLAbel:='янгдюк';
        FieldByName('proekt').DisplayLAbel:='опнейр';
    end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;

procedure TFNaryd_Delete.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFNaryd_Delete.Button1Click(Sender: TObject);
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


procedure TFNaryd_Delete.DateTimePicker1Change(Sender: TObject);
begin
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
end;

procedure TFNaryd_Delete.DateTimePicker2Change(Sender: TObject);
begin
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;

end.
