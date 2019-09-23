unit Unit66;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls;

type
  TForm66 = class(TForm)
    DBGridEh1: TDBGridEh;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1zak: TStringField;
    OraQuery1nomertk: TStringField;
    OraQuery1nametk: TStringField;
    OraQuery1dattk: TStringField;
    OraQuery1nomertx: TStringField;
    OraQuery1nametx: TStringField;
    OraQuery1dattx: TStringField;
    OraQuery1trudtk: TFloatField;
    OraQuery1trudtx: TFloatField;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form66: TForm66;
implementation

uses Unit9;

{$R *.dfm}

procedure TForm66.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);

tx:=' ';
tx:=tx+'select tt.zak zak,tt.nomertk nomertk,tt.nametk nametk, tt.dattk dattk,tt.nomertx nomertx,tt.nametx nametx,';
tx:=tx+' tt.dattx dattx,tt.trudtk trudtk,tt.trudtx trudtx';

tx:=tx+' from (';

tx:=tx+' select distinct t.zak zak, t.nomertk nomertk, t.nomertx nomertx,max(t.nametk) nametk,max(t.dattk) dattk,';
tx:=tx+' max(t.nametx) nametx,max(t.dattx) dattx, max(t.trudoemtk) trudtk,max(t.trudoemtx) trudtx';

tx:=tx+' from (';
tx:=tx+' select z.zak zak,tk.nomer nomertk, to_char(tk.otk_end,''DD.MM.YYYY'') dattk,tk.name nametk,nordsy.sum_trud(tk.texkompl_id) trudoemtk,';
tx:=tx+' tx.nomer nomertx,'' '' dattx, tx.name nametx, nordsy.sum_trud(tx.texkompl_id) trudoemtx';
//tx:=tx+' tx.nomer nomertx, to_char(tx.otk_end,''DD.MM.YYYY'') dattx, tx.name nametx, nordsy.sum_trud(tx.texkompl_id) trudoemtx';

tx:=tx+' from nordsy.texkompl tx, nordsy.texkompl tk, feb_zakaz z, tronix_project_list pr, kadry_dep de,kadry_dep dd';

tx:=tx+' where tx.type_tex_type_tex_id in (12,14) and tx.project_project_id=pr.project_id(+)';
tx:=tx+' and pr.project_id=z.id_project and z.id_project='+edit1.text;
tx:=tx+' and nordsy.uzak_tx(tx.texkompl_id)=z.nn and upper(z.zak)  not like (''%Ã—◊%'')';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.texkompl_texkompl_id,''œ”≈'',''TYPE''),tx.texkompl_texkompl_id)=tk.texkompl_id';
tx:=tx+' and tx.dep_dep_id=de.dep_id(+) and dd.dep_id='+edit2.text+' and dd.dep_id in (tx.dep_dep_id,de.dep_dep_id)';
tx:=tx+' and to_char(tx.otk_end,''YYYYMMDD'') is null';

tx:=tx+' union';

//tx:=tx+' select z.zak zak,tk.nomer nomertk,  to_char(tk.otk_end,''DD.MM.YYYY'') dattk,tk.name nametk,';
tx:=tx+' select z.zak zak,tk.nomer nomertk,  '' '' dattk,tk.name nametk,';
tx:=tx+' nordsy.sum_trud(tk.texkompl_id) trudoemtk,'' '' nomertx, '' '' dattx,'' '' nametx, 0 trudoemtx';
tx:=tx+' from  nordsy.texkompl tk, feb_zakaz z,tronix_project_list pr,kadry_dep de,kadry_dep dd';

tx:=tx+' where tk.type_tex_type_tex_id in (7,8) and tk.project_project_id=pr.project_id(+)';
tx:=tx+' and pr.project_id=z.id_project and z.id_project='+edit1.text;
tx:=tx+' and nordsy.uzak_tx(tk.texkompl_id)=z.nn and upper(z.zak)  not like (''%Ã—◊%'')';
tx:=tx+' and tk.dep_dep_id=de.dep_id(+) and dd.dep_id='+edit2.text+' and dd.dep_id in (tk.dep_dep_id,de.dep_dep_id)';
tx:=tx+' and to_char(tk.otk_end,''YYYYMMDD'') is null';
tx:=tx+') t';
tx:=tx+' group by t.zak,t.nomertk,t.nomertx';
tx:=tx+') tt';
tx:=tx+' order by tt.zak,tt.nomertk,tt.nomertx';

//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('zak').DisplayLAbel:='«¿¬.π ';
        FieldByName('nomertk').DisplayLAbel:='“ \“Õ ';
        FieldByName('nametk').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ “ \“Õ ';
        FieldByName('dattk').DisplayLAbel:='ƒ¿“¿ «¿ –.“ \“Õ ';
        FieldByName('nomertx').DisplayLAbel:='“ \“Õ\œ“  ';
        FieldByName('nametx').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ œ“  ';
        FieldByName('dattx').DisplayLAbel:='ƒ¿“¿ «¿ –.œ“  ';
        FieldByName('trudtk').DisplayLAbel:='“–-“‹ “ \“Õ ';
        FieldByName('trudtx').DisplayLAbel:='“–-“‹ œ“ ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

 end;

procedure TForm66.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TForm66.Button1Click(Sender: TObject);
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
