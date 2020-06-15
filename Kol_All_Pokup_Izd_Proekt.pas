unit Kol_All_Pokup_Izd_Proekt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TFKol_All_Pokup_Izd_Proekt = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1kod: TStringField;
    OraQuery1tynomer: TStringField;
    OraQuery1kol: TFloatField;
    OraQuery1namek: TStringField;
    OraQuery1name: TStringField;
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
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FKol_All_Pokup_Izd_Proekt: TFKol_All_Pokup_Izd_Proekt;

implementation

uses Unit9, Kol_Pokup_Izd_TN_SP;

{$R *.dfm}

procedure TFKol_All_Pokup_Izd_Proekt.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);
tx:=' ';
tx:=tx+'select s.kod kod, decode(s.oboznold,null,ty.name,ty.name||''(''||s.oboznold||'')'') tynomer,';
tx:=tx+' decode(l.namek,''ØÒ'',round(l.kol,0),''Ê-Ò'',round(l.kol,0),round(l.kol,4)) kol,';
tx:=tx+' l.namek namek,tronix.sp_name(s.sprav_id) name';
tx:=tx+' from';
tx:=tx+' (';
tx:=tx+' select z.zak zak, s.sprav_id kid,sum(p.kol) kol, ed.namek namek';
tx:=tx+' from nordsy.car_potr p, tronix.sprav s,tronix.koded ed,feb_zakaz z';
tx:=tx+' where p.project_project_id=z.id_project and p.uzak_uzak_id=z.nn and z.id_project='+edit1.text;
tx:=tx+' and upper(z.zak) like (''%%ÌÑ×%%'')';
tx:=tx+' and p.sprav_sprav_id=s.sprav_id and tronix_select_mat(s.tree_tree_id,''02'')=1';
//tx:=tx+' and s.kod=''1211191315''';
tx:=tx+' and nvl(s.can_do_self,0)=0 and nvl(s.l_ogran,0)=1 and nvl(s.rossip,0)=0';
tx:=tx+' and p.koded_koded_id=ed.koded_id';
tx:=tx+' group by p.project_project_id,z.zak, s.sprav_id, ed.namek';
tx:=tx+' ) l,';
tx:=tx+' tronix.sprav s,tronix.typ_lov ty';
tx:=tx+' where l.kid=s.sprav_id and s.typ_lov_typ_lov_id=ty.typ_lov_id(+)';
tx:=tx+' order by s.kod';
//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('kod').DisplayLAbel:='ÊÎÄ ';
        FieldByName('tynomer').DisplayLAbel:='×ÅÐÒ¨Æ ';
        FieldByName('kol').DisplayLAbel:='ÊÎË-ÂÎ ';
        FieldByName('namek').DisplayLAbel:='ÅÄ.ÈÇÌ. ';
        FieldByName('name').DisplayLAbel:='ÍÀÈÌÅÍÎÂÀÍÈÅ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TFKol_All_Pokup_Izd_Proekt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFKol_All_Pokup_Izd_Proekt.Button1Click(Sender: TObject);
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


procedure TFKol_All_Pokup_Izd_Proekt.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

    if (Column.FieldName='kol') and (Column.Field.Dataset.FieldByName('kol').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFKol_All_Pokup_Izd_Proekt.DBGridEh1DblClick(Sender: TObject);
begin
  Application.CreateForm(TFKol_Pokup_Izd_TN_SP, FKol_Pokup_Izd_TN_SP);
  FKol_Pokup_Izd_TN_SP.Edit1.Text:=FKol_All_Pokup_Izd_Proekt.Edit1.Text;
  FKol_Pokup_Izd_TN_SP.Edit2.Text:=oraQuery1.FieldByName('kod').asString;
  FKol_Pokup_Izd_TN_SP.Caption:=FKol_Pokup_Izd_TN_SP.Caption+'  ×ÅÐÒ¨Æ='+oraQuery1.FieldByName('tynomer').asString+' Êîëè÷åñòâî='+oraQuery1.FieldByName('kol').asString+' '+oraQuery1.FieldByName('namek').asString;
  FKol_Pokup_Izd_TN_SP.ShowModal();
  FKol_Pokup_Izd_TN_SP.Free;

end;

procedure TFKol_All_Pokup_Izd_Proekt.Button2Click(Sender: TObject);
begin
  Application.CreateForm(TFKol_Pokup_Izd_TN_SP, FKol_Pokup_Izd_TN_SP);
  FKol_Pokup_Izd_TN_SP.Edit1.Text:=FKol_All_Pokup_Izd_Proekt.Edit1.Text;
  FKol_Pokup_Izd_TN_SP.Edit2.text:='All';
  FKol_Pokup_Izd_TN_SP.ShowModal();
  FKol_Pokup_Izd_TN_SP.Free;
end;

end.
