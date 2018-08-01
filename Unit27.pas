unit Unit27;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, GridsEh,
   ExcelXP, OleServer,ComObj, ExtCtrls;

type
  TForm27 = class(TForm)
    Edit1: TEdit;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    OraQuery1IDENT: TStringField;
    OraQuery1type: TStringField;
    OraQuery1NAME: TStringField;
    OraQuery1document_id: TFloatField;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    CheckBox2: TCheckBox;
    Button1: TButton;
    Edit3: TEdit;
    OraQuery3: TOraQuery;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    OraQuery2: TOraQuery;
    CheckBox6: TCheckBox;
    RadioGroup1: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure OraQuery3CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form27: TForm27;

implementation

uses Unit28, Unit29,Unit51;

{$R *.dfm}

procedure TForm27.FormShow(Sender: TObject);
var tx:string;
begin
tx:=' Select IDENT, (Select type||'' ''||name from tronix.document_type where document_type_id=id_document_type) type,NAME, document_id';
tx:=tx+' from tronix.document';
tx:=tx+' where id_project='+Edit1.text;
tx:=tx+' order by ident';
       CheckBox6.Checked:=false;
       CheckBox1.Visible:=true;
     CheckBox2.Visible:=true;
     Button1.Visible:=true;
      CheckBox3.Visible:=false;
      CheckBox4.Visible:=false;
//   CheckBox5.Visible:=false;
   RadioGroup1.ItemIndex:=-1;

if Caption='Отчёт по сравнению потребности с ведомостями заказа' then
 begin
tx:=' Select IDENT, (Select type||'' ''||name from tronix.document_type where document_type_id=id_document_type) type,NAME, document_id';
tx:=tx+' from tronix.document';
tx:=tx+' where id_project='+Edit1.text;
tx:=tx+' and  id_document_type in (17,18,19,20) ';
tx:=tx+' order by ident';

   CheckBox1.Visible:=false;
   CheckBox2.Visible:=false;
   Button1.Visible:=false;
   CheckBox3.Visible:=false;
   CheckBox4.Visible:=false;
   RadioGroup1.Visible:=false;
//   CheckBox5.Visible:=false;
 end;


    OraQuery1.SQL.Text:=tx;
  OraQuery1.ExecSQL;

if  Copy(Caption, 1, 41)='Проверка масс (спецификация и справочник)' then
   begin
     CheckBox1.Visible:=false;
     CheckBox2.Visible:=false;
     Button1.Visible:=false;
      CheckBox3.Visible:=true;
     CheckBox4.Visible:=true;
     RadioGroup1.Visible:=false;
 //  CheckBox5.Visible:=false;
   end;
//        ShowMEssage(copy(Caption,1,27));
if 'Выгружаем транспортный файл.'=copy(Caption,1,28) then
  begin
        CheckBox1.Visible:=false;
     CheckBox2.Visible:=false;
     Button1.Visible:=false;
      CheckBox3.Visible:=false;
     CheckBox4.Visible:=false;
   RadioGroup1.Visible:=false;
 //  CheckBox5.Visible:=false;
     DbgridEh1.Options:=DbgridEh1.Options-[dgMultiSelect];

  end;

end;

procedure TForm27.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   OraQuery1.Close;

end;

procedure TForm27.DBGridEh1DblClick(Sender: TObject);
var e: integer;
tx:string;
FExcel, WorkBook, SheetActive, Sheet, Colum : OleVariant;
begin

if 'Выгружаем транспортный файл.'=copy(Caption,1,28) then
  begin
  // ShowMEssage(oraQuery1.FieldByName('document_id').asString);
     Application.CreateForm(TForm51, Form51);
       Form51.Caption:=OraQuery1.FieldByName('IDENT').AsString;
       Form51.Label1.CAption:=OraQuery1.FieldByName('document_id').AsString;
      Form51.ShowModal()

end;

 if  Copy(Caption, 1, 29)='Потребность в разрезе чертежа' then
    begin
   if Edit3.Text='' then Edit3.Text:=oraQuery1.FieldByName('document_id').asString;
  if CheckBox1.Checked=false then
   begin
//   if RadioGroup1.ItemIndex=0 then
//  ShowMessage('ТРУБЫ');

//    if RadioGroup1.ItemIndex=1 then
// ShowMessage('Отводы');

//    if RadioGroup1.ItemIndex=2 then
// ShowMessage('Уголок');


//    if RadioGroup1.ItemIndex=3 then
// ShowMessage('Запорная Арматура');

//    if RadioGroup1.ItemIndex=4 then
//ShowMessage('Изоляция')
// else if RadioGroup1.ItemIndex=5 then
// ShowMessage('Вся номенклатура');


   Form28.Edit1.Text:=Edit3.Text ;
  Form28.Edit2.Text:=Edit1.Text;
  Form28.Edit3.Text:=Edit2.Text;
  Form28.Caption:='Потребность по материалам в разрезе чертежа по материалу'; // ShowMessage(Edit3.Text);
  if (RadioGroup1.ItemIndex>-1) and (RadioGroup1.ItemIndex<5) then
  Form28.Caption:=Form28.Caption+': '+RadioGroup1.Items[RadioGroup1.ItemIndex];
  Edit3.Text:='';
  Form28.ShowModal();
   end;

   if CheckBox1.Checked=true then
   begin
  Form29.Edit1.Text:=Edit3.Text;
  Form29.Edit2.Text:=Edit1.Text;
  Form29.Edit3.Text:=Edit2.Text;
  Form29.Caption:='Потребность по материалам в разрезе чертежа по материалу (МСЧ)';
   Edit3.Text:='';
  Form29.ShowModal();
   end;
   end; //// для цеха
if  Copy(Caption, 1, 41)='Проверка масс (спецификация и справочник)' then
   begin
     if  CheckBox4.Checked=false then
        begin
 tx:='  Select id_sprav,poz,kod1, ';
tx:=tx+' DECODE (nvl(mass_sprav1,0),0,ed_cher,ed_cher1) ed_cher ,';
tx:=tx+' DECODE (nvl(mass_sprav1,0),0,kol,kol1) kol ,round(mass,2) mass, ';
tx:=tx+' DECODE (nvl(mass_sprav1,0),0,(Select namek from tronix.koded where koded_id=ed_sprav),(Select namek from tronix.koded where koded_id=ed_sprav1)) ed_sprav,';
tx:=tx+' decode(nvl(mass_sprav1,0),0,round(mass_sprav,2),round(mass_sprav1,2)) mass_sprav, ';
tx:=tx+' decode(nvl(mass_sprav1,0),0,round(mass-mass_sprav,2),round(mass-mass_sprav1,2)) delta, ';
tx:=tx+' chert, ';
tx:=tx+' (Select kod from tronix.sprav where sprav_id=id_sprav) kod ';
 tx:=tx+' from ';
 tx:=tx+' ( ';
 tx:=tx+' Select id_sprav, poz||'' ''||podpoz poz,sp.kod kod1, ';
 tx:=tx+' (Select namek from tronix.koded where koded=sp.kode) ed_cher, ';
 tx:=tx+' (Select namek from tronix.koded where koded=sp.kode_tx) ed_cher1, ';
 tx:=tx+' kol_tx kol1, ';
 tx:=tx+' kol, mass, ';
 tx:=tx+' (Select koded_koded_id from tronix.sprav where sprav_id=sp.id_sprav) ed_sprav, ';
 tx:=tx+' TRONIX_KOF_KODED(sp.id_sprav,(Select koded_id from tronix.koded where koded=sp.kode),10)*kol mass_sprav, ';
 tx:=tx+' ident chert, ';
 tx:=tx+' TRONIX_KOF_KODED(sp.id_sprav,(Select koded_id from tronix.koded where koded=sp.kode_tx),10)*kol_tx mass_sprav1, ';
 tx:=tx+' (Select koded_id from tronix.koded where koded=sp.kode_tx) ed_sprav1 ';
 tx:=tx+' from tronix.sp sp, tronix.document ';
 tx:=tx+' where ';
 tx:=tx+' sp.nnn=document_id ';
 if CheckBox3.Checked=false then
    tx:=tx+' and document_id='+ oraQuery1.FieldByName('document_id').asString
 else
    tx:=tx+' and id_project='+ Edit1.text;
 tx:=tx+' and nvl(id_sp_work,0)  in (2,0,6) ';
 tx:=tx+' and (Select can_do_self from tronix.sprav where sprav_id=sp.id_sprav) is null ';
tx:=tx+' and nvl(type_str,0)<>1 ';
 tx:=tx+' ) ';
 tx:=tx+' where decode(nvl(mass_sprav1,0),0,round(mass-mass_sprav,2),round(mass-mass_sprav1,2))<>0 ';
 tx:=tx+' order by chert, ';
 tx:=tx+' decode(translate(poz, ''_0123456789'', ''_''), null, poz, poz) ';
     //    ShowMessage(tx);
     end;
  if CheckBox4.Checked=true then
      begin
tx:=' Select id_sprav,poz,kod,ed_cher,kol,mass,(Select namek from tronix.koded where koded_id=ed_sprav)ed_sprav,mass_sprav,round(mass-mass_sprav,2) delta,chert ';
tx:=tx+' from ';
tx:=tx+' (( ';
tx:=tx+'   Select id_sprav, poz||'' ''||podpoz poz, ';
tx:=tx+'  (Select kod from tronix.sprav where sprav_id=id_sprav) kod, ';
tx:=tx+'   (Select namek from tronix.koded where koded=sp.kode) ed_cher, ';
tx:=tx+'   (Select namek from tronix.koded where koded=sp.kode_tx) ed_cher1, ';
tx:=tx+'   kol_tx kol1, ';
tx:=tx+'   kol, mass, ';
tx:=tx+'   (Select koded_koded_id from tronix.sprav where sprav_id=sp.id_sprav) ed_sprav, ';  //koded_koded_id
tx:=tx+'   TRONIX_KOF_KODED(sp.id_sprav,(Select koded_id from tronix.koded where koded=sp.kode),10)*kol mass_sprav, ';
tx:=tx+'   ident chert, ';
tx:=tx+'   TRONIX_KOF_KODED(sp.id_sprav,(Select koded_id from tronix.koded where koded=sp.kode_tx),10)*kol_tx mass_sprav1, ';
tx:=tx+'   (Select koded_id from tronix.koded where koded=sp.kode_tx) ed_sprav1 ';
tx:=tx+'   from tronix.sp sp, tronix.document ';
tx:=tx+'   where ';
tx:=tx+'   sp.nnn=document_id ';
    if CheckBox3.Checked=false then
 tx:=tx+' and document_id='+ oraQuery1.FieldByName('document_id').asString

    else
 tx:=tx+' and id_project='+ Edit1.text;
tx:=tx+'   and nvl(id_sp_work,0)  in (2,0) ';
tx:=tx+'   and (Select can_do_self from tronix.sprav where sprav_id=sp.id_sprav) is null ';
tx:=tx+'  and nvl(type_str,0)<>1) ';
tx:=tx+' union all ';
tx:=tx+' ( ';
tx:=tx+'   Select id_sprav,poz,kod, ';
tx:=tx+'  decode(ed_cher,''ШТ'',ed_cher,ed_cher) ed_cher, ';
tx:=tx+'  ed_cher1, kol1, ';
tx:=tx+'   decode(ed_cher,''ШТ'',kol1,kol)  kol, ';
tx:=tx+'    mass, ';
tx:=tx+'   decode(ed_cher,''ШТ'',ed_sprav1,ed_sprav)   ed_sprav, ';
tx:=tx+'   decode(ed_cher,''ШТ'',mass_sprav1,mass_sprav)  mass_sprav, ';
tx:=tx+'    chert, ';
tx:=tx+'     mass_sprav1,ed_sprav1 ';
tx:=tx+'    from ( ';
tx:=tx+'   Select id_sprav, poz||'' ''||podpoz poz,sp.kod kod1, ';
tx:=tx+'  (Select kod from tronix.sprav where sprav_id=id_sprav) kod, ';
tx:=tx+'   (Select namek from tronix.koded where koded=sp.kode) ed_cher, ';
tx:=tx+'   (Select namek from tronix.koded where koded=sp.kode_tx) ed_cher1, ';
tx:=tx+'   kol_tx kol1, ';
tx:=tx+'   kol, mass, ';
tx:=tx+'   (Select koded_koded_id from tronix.sprav where sprav_id=sp.id_sprav) ed_sprav, ';
tx:=tx+'   TRONIX_KOF_KODED(sp.id_sprav,(Select koded_id from tronix.koded where koded=sp.kode),10)*kol mass_sprav, ';
tx:=tx+'   ident chert, ';
tx:=tx+'   TRONIX_KOF_KODED(sp.id_sprav,(Select koded_id from tronix.koded where koded=sp.kode_tx),10)*kol_tx mass_sprav1, ';
tx:=tx+'   (Select koded_id from tronix.koded where koded=sp.kode_tx) ed_sprav1 ';
tx:=tx+'   from tronix.sp sp, tronix.document ';
tx:=tx+'   where ';
tx:=tx+'   sp.nnn=document_id ';
    if CheckBox3.Checked=false then
 tx:=tx+' and document_id='+ oraQuery1.FieldByName('document_id').asString

    else
 tx:=tx+' and id_project='+ Edit1.text;
tx:=tx+'   and nvl(id_sp_work,0)=6 ';
tx:=tx+'   and (Select can_do_self from tronix.sprav where sprav_id=sp.id_sprav) is null ';
tx:=tx+'  and nvl(type_str,0)<>1)) ';
tx:=tx+' ) ';
tx:=tx+'   where round(mass-mass_sprav,2)<>0 ';
tx:=tx+'   order by chert, ';
tx:=tx+'    decode(translate(poz, ''_0123456789'', ''_''), null, poz, poz) ';

      end;
   OraQuery3.SQL.Text:=tx;
   OraQuery3.ExecSQL;

  if  OraQuery3.RecordCount=0 then
         ShowMessage('Нет позиций!')
        else
    begin
   FExcel:=CreateOleObject('Excel.Application');
   FExcel.EnableEvents := False;
   FExcel.Visible:=false;
   FExcel.Workbooks.Add(-4167);
   FExcel.Workbooks[1].WorkSheets[1].Name:='Массы';
   Colum:=FExcel.Workbooks[1].WorkSheets['Массы'].Columns;
   Colum.Columns[1].ColumnWidth:=20;
   Colum.Columns[2].ColumnWidth:=6;
   Colum.Columns[3].ColumnWidth:=20;
   Colum.Columns[4].ColumnWidth:=15;
   Colum.Columns[5].ColumnWidth:=15;
   Colum.Columns[6].ColumnWidth:=10;
   Colum.Columns[7].ColumnWidth:=10;
   Colum.Columns[8].ColumnWidth:=30;
   Colum.Columns[9].ColumnWidth:=20;
   Colum.Columns[10].ColumnWidth:=20;
  Colum.Columns[11].ColumnWidth:=10;
  Colum.Columns[12].ColumnWidth:=10;
  Colum.Columns[13].ColumnWidth:=10;
  Colum.Columns[14].ColumnWidth:=10;
  Colum.Columns[15].ColumnWidth:=10;
   Colum.Columns[16].ColumnWidth:=10;

   Sheet:=FExcel.Workbooks[1].WorkSheets['Массы'];
   Sheet.Cells[1,1]:='                             Отчет   по '+Caption+' на '+DateToStr(now);
Sheet.Cells[1,1].Font.Bold := True;
Sheet.Cells[1,1].Font.Size := Sheet.Cells[1,2].Font.Size+5;
Sheet.Cells[2,1]:='№ черт.';
Sheet.Cells[2,1].Font.Bold := True;
Sheet.Cells[2,1].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,2]:='поз.';
Sheet.Cells[2,2].Font.Bold := True;
Sheet.Cells[2,2].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,3]:='код поз.черт.';
Sheet.Cells[2,3].Font.Bold := True;
Sheet.Cells[2,3].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,4]:='ед. черт. ';
Sheet.Cells[2,4].Font.Bold := True;
Sheet.Cells[2,4].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,5]:='кол черт.';
Sheet.Cells[2,5].Font.Bold := True;
Sheet.Cells[2,5].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,6]:='масса черт.';
Sheet.Cells[2,6].Font.Bold := True;
Sheet.Cells[2,6].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,7]:='ед. справ.';
Sheet.Cells[2,7].Font.Bold := True;
Sheet.Cells[2,7].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,8]:='масса справ.';
Sheet.Cells[2,8].Font.Bold := True;
Sheet.Cells[2,8].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,9]:='Разница между чертежом и справочником ';
Sheet.Cells[2,9].Font.Bold := True;
Sheet.Cells[2,9].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.range[Sheet.cells[2,1],Sheet.cells[2,9]].borders.weight:=3;

 e:=1;
While e<=OraQuery3.RecordCount Do
 Begin
      Sheet.range[Sheet.cells[e+2,1],Sheet.cells[e+2,15]].NumberFormat:= '@';
      Sheet.Cells[e+2,1]:=OraQuery3.FieldByName('chert').AsString;

      Sheet.Cells[e+2,2].NumberFormat:= '@';
      Sheet.Cells[e+2,2]:=OraQuery3.FieldByName('poz').AsString;

      Sheet.Cells[e+2,3].NumberFormat:= '@';
      Sheet.Cells[e+2,3]:=OraQuery3.FieldByName('kod').AsString;
       Sheet.Cells[e+2,4].NumberFormat:= '@';
      Sheet.Cells[e+2,4]:=OraQuery3.FieldByName('ed_cher').AsString;

      Sheet.Cells[e+2,5].NumberFormat:= '@';
      Sheet.Cells[e+2,5]:=OraQuery3.FieldByName('kol').AsString;

            Sheet.Cells[e+2,6].NumberFormat:= '@';
      Sheet.Cells[e+2,6]:=OraQuery3.FieldByName('mass').AsString;

      Sheet.Cells[e+2,7].NumberFormat:= '@';
      Sheet.Cells[e+2,7]:=OraQuery3.FieldByName('ed_sprav').AsString;

      Sheet.Cells[e+2,8].NumberFormat:= '@';
      Sheet.Cells[e+2,8]:=OraQuery3.FieldByName('mass_sprav').AsString;

       Sheet.Cells[e+2,9].NumberFormat:= '@';
      Sheet.Cells[e+2,9]:=OraQuery3.FieldByName('delta').AsString;
       OraQuery3.Next;
   e:=e+1;

   end;
    FExcel.Visible:=true;
    end;
   end;

if caption='Отчёт по сравнению потребности с ведомостями заказа' then
  begin

    OraQuery3.Fields.Clear;


 With TStringField.Create(OraQuery3) do
   begin
    FieldName := 'ident';
      DataSet:=OraQuery3;
    FieldKind:=fkDAta;
  end;

  With TStringField.Create(OraQuery3) do
   begin
    FieldName := 'poz';
      DataSet:=OraQuery3;
    FieldKind:=fkDAta;
  end;

    With TStringField.Create(OraQuery3) do
   begin
    FieldName := 'kod';
      DataSet:=OraQuery3;
    FieldKind:=fkDAta;
  end;

      With TStringField.Create(OraQuery3) do
   begin
    FieldName := 'name';
      DataSet:=OraQuery3;
    FieldKind:=fkDAta;
  end;

        With TStringField.Create(OraQuery3) do
   begin
    FieldName := 'ed_koded';
      DataSet:=OraQuery3;
    FieldKind:=fkDAta;
  end;

       With TFloatField.Create(OraQuery3) do
     begin
              FieldName := 'BKOLA';
            DataSet:=OraQuery3;
            FieldKind:=fkDAta;
    end;

        With TFloatField.Create(OraQuery3) do
     begin
              FieldName := 'AKOL';
            DataSet:=OraQuery3;
            FieldKind:=fkDAta;
    end;
           With TFloatField.Create(OraQuery3) do
     begin
              FieldName := 'BKOL';
            DataSet:=OraQuery3;
            FieldKind:=fkDAta;
    end;

            With TFloatField.Create(OraQuery3) do
     begin
              FieldName := 'sprav_sprav_id';
            DataSet:=OraQuery3;
            FieldKind:=fkDAta;
    end;


            With TStringField.Create(OraQuery3) do
   begin
    FieldName := 'texkompl_sp';
      DataSet:=OraQuery3;
    FieldKind:=fkCalculated;
    Size := 1000;
  end;
          With TStringField.Create(OraQuery3) do
    begin      
      FieldName := 'chertezh_sp';
      DataSet:=OraQuery3;
    FieldKind:=fkCalculated;
    Size := 1000;
  end;


tx:=' Select B.IDENT,B.POZ, B.KOD, B.NAME,(Select namek from tronix.koded where koded_id=B.KODED_ID)ed_KODED, B.KOLA BKOLA, B.Sprav_sprav_id, A.KOL AKOL,B.KOL BKOL ';
tx:=tx+' from ';
tx:=tx+' (Select trn.ident,trn.poz,(Select kod from tronix.sprav where sprav_id=sprav_sprav_id) kod, trn.name, ';
tx:=tx+' trn.koded_id,trn.kola, ';
tx:=tx+' sprav_sprav_id,  sum(kol) kol, koded_koded_id ';
tx:=tx+' from tx_car_POTR , ';
tx:=tx+' (Select  ident, ';
tx:=tx+'  id_sprav, ';
tx:=tx+'  poz||''   ''||podpoz as poz, sp.kod, sp.name, ';
tx:=tx+' (Select koded_id from tronix.koded where koded=kode) as koded_id, ';
tx:=tx+' kol kola ';
tx:=tx+' from tronix.document ,tronix.sp sp ';
tx:=tx+' where ';
tx:=tx+' document_id= '+oraQuery1.FieldByName('document_id').asString;
tx:=tx+' and nnn=document_id ';
tx:=tx+' ) trn ';
tx:=tx+' where ';
tx:=tx+' sprav_sprav_id(+) =trn.id_sprav ';
tx:=tx+' and project_project_id='+ Edit1.text;
tx:=tx+' group by trn.kola,koded_koded_id ,sprav_sprav_id,trn.ident,trn.poz, trn.kod, trn.name, ';
tx:=tx+' trn.koded_id) A ';
tx:=tx+' , ';
tx:=tx+' ( ';
tx:=tx+' Select trn.ident,trn.poz, (Select kod from tronix.sprav where sprav_id=sprav_sprav_id) kod, trn.name, ';
tx:=tx+' trn.koded_id,trn.kola, ';
tx:=tx+' sprav_sprav_id, sum(kol) kol, koded_koded_id ';
tx:=tx+' from tx_all_POTR , ';
tx:=tx+' (Select  ident, ';
tx:=tx+'  id_sprav, ';
tx:=tx+'  poz||''   ''||podpoz as poz, sp.kod, sp.name, ';
tx:=tx+' (Select koded_id from tronix.koded where koded=kode) as koded_id, ';
tx:=tx+' kol kola ';
tx:=tx+' from tronix.document ,tronix.sp sp ';
tx:=tx+' where ';
tx:=tx+' document_id='+oraQuery1.FieldByName('document_id').asString;
tx:=tx+' and nnn=document_id) trn ';
tx:=tx+' where ';
tx:=tx+' sprav_sprav_id =trn.id_sprav ';
tx:=tx+' and project_project_id='+ Edit1.text;
tx:=tx+' and date_p<=Decode(floor(months_between(TRUNC (sysdate),(Select max(date_p) from tx_all_POTR where project_project_id='+ Edit1.text+'))),0,(trunc(Sysdate)-30),(Select max(date_p) from tx_all_POTR where project_project_id='+ Edit1.text+')) ';
tx:=tx+' and date_p>Decode(floor(months_between(TRUNC (sysdate),(Select max(date_p) from tx_all_POTR where project_project_id='+ Edit1.text+'))),0,(trunc(Sysdate)-30),(Select max(date_p) from tx_all_POTR where project_project_id='+ Edit1.text+'))-6 ';
tx:=tx+' group by  koded_koded_id ,sprav_sprav_id,trn.ident,trn.poz, trn.kod, trn.name, trn.kola, ';
tx:=tx+' trn.koded_id ';
tx:=tx+' ) B ';
tx:=tx+' where  B.Sprav_sprav_id=A.Sprav_sprav_id(+) ';
tx:=tx+' and b.poz=a.poz(+) ';
tx:=tx+' order by poz ';
   OraQuery3.SQL.Text:=tx;
   OraQuery3.ExecSQL;

  if  OraQuery3.RecordCount>0 then
    begin

 FExcel:=CreateOleObject('Excel.Application');
   FExcel.EnableEvents := False;
   FExcel.Visible:=false;
   FExcel.Workbooks.Add(-4167);
   FExcel.Workbooks[1].WorkSheets[1].Name:='Сравнение';
   Colum:=FExcel.Workbooks[1].WorkSheets['Сравнение'].Columns;
   Colum.Columns[1].ColumnWidth:=20;
   Colum.Columns[2].ColumnWidth:=8;
   Colum.Columns[3].ColumnWidth:=10;
   Colum.Columns[4].ColumnWidth:=55;
   Colum.Columns[5].ColumnWidth:=10;
   Colum.Columns[6].ColumnWidth:=10;
   Colum.Columns[7].ColumnWidth:=10;
   Colum.Columns[8].ColumnWidth:=30;
   Colum.Columns[9].ColumnWidth:=50;
   Colum.Columns[10].ColumnWidth:=50;

   Sheet:=FExcel.Workbooks[1].WorkSheets['Сравнение'];
   Sheet.Cells[1,1]:='                             Отчет   по '+Caption+' на '+DateToStr(now);
Sheet.Cells[1,1].Font.Bold := True;
Sheet.Cells[1,1].Font.Size := Sheet.Cells[1,2].Font.Size+5;
Sheet.Cells[2,1]:='Номер ведомости';
Sheet.Cells[2,1].Font.Bold := True;
Sheet.Cells[2,1].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,2]:='Номер позиции по ведомости';
Sheet.Cells[2,2].Font.Bold := True;
Sheet.Cells[2,2].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,3]:='Код позиции';
Sheet.Cells[2,3].Font.Bold := True;
Sheet.Cells[2,3].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,4]:='Наим. позиции ';
Sheet.Cells[2,4].Font.Bold := True;
Sheet.Cells[2,4].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,5]:='Кол-во поз. по ведомости';
Sheet.Cells[2,5].Font.Bold := True;
Sheet.Cells[2,5].Font.Size := Sheet.Cells[1,1].Font.Size-3;

Sheet.Cells[2,6]:='Ед.  изм.';
Sheet.Cells[2,6].Font.Bold := True;
Sheet.Cells[2,6].Font.Size := Sheet.Cells[1,1].Font.Size-3;

Sheet.Cells[2,7]:='Кол-во по потребности в пределах заказа (наст. время)';
Sheet.Cells[2,7].Font.Bold := True;
Sheet.Cells[2,7].Font.Size := Sheet.Cells[1,1].Font.Size-3;

Sheet.Cells[2,8]:='Кол-во по потребности в пределах заказа (месяцем ранее)';
Sheet.Cells[2,8].Font.Bold := True;
Sheet.Cells[2,8].Font.Size := Sheet.Cells[1,1].Font.Size-3;

Sheet.Cells[2,9]:='Входимость позиции по чертежам.';
Sheet.Cells[2,9].Font.Bold := True;
Sheet.Cells[2,9].Font.Size := Sheet.Cells[1,1].Font.Size-3;

Sheet.Cells[2,10]:='Входимость позиции по планово-учётным единицам (тк, птк, ТН)';
Sheet.Cells[2,10].Font.Bold := True;
Sheet.Cells[2,10].Font.Size := Sheet.Cells[1,1].Font.Size-3;


     e:=1;
    OraQuery3.First;
      While NOT OraQuery3.Eof   do
         begin
       Sheet.range[Sheet.cells[e+2,1],Sheet.cells[e+2,15]].NumberFormat:= '@';
      Sheet.Cells[e+2,1]:=OraQuery3.FieldByName('IDENT').AsString;

      Sheet.Cells[e+2,2].NumberFormat:= '@';
      Sheet.Cells[e+2,2]:=OraQuery3.FieldByName('poz').AsString;

      Sheet.Cells[e+2,3].NumberFormat:= '@';
      Sheet.Cells[e+2,3]:=OraQuery3.FieldByName('kod').AsString;
       Sheet.Cells[e+2,4].NumberFormat:= '@';
      Sheet.Cells[e+2,4]:=OraQuery3.FieldByName('name').AsString;

      Sheet.Cells[e+2,5].NumberFormat:= '@';
      Sheet.Cells[e+2,5]:=OraQuery3.FieldByName('BKOLA').AsString;

      Sheet.Cells[e+2,6].NumberFormat:= '@';
      Sheet.Cells[e+2,6]:=OraQuery3.FieldByName('ed_koded').AsString;


      Sheet.Cells[e+2,7].NumberFormat:= '@';
      Sheet.Cells[e+2,7]:=OraQuery3.FieldByName('AKOL').AsString;

      Sheet.Cells[e+2,8].NumberFormat:= '@';
      Sheet.Cells[e+2,8]:=OraQuery3.FieldByName('BKOL').AsString;

      Sheet.Cells[e+2,9].NumberFormat:= '@';
      Sheet.Cells[e+2,9]:=OraQuery3.FieldByName('chertezh_sp').AsString;

      Sheet.Cells[e+2,10].NumberFormat:= '@';
      Sheet.Cells[e+2,10]:=OraQuery3.FieldByName('texkompl_sp').AsString;
        e:=e+1;
       OraQuery3.Next;
      end;
           FExcel.Visible:=true;
      end;


   OraQuery3.Fields.Clear;
     OraQuery3.Close;
   end;


  end;


procedure TForm27.Button1Click(Sender: TObject);
var i:integer;
spisok: string;
begin
  spisok:='';
if DBGridEh1.SelectedRows.Count >= 0 then
    begin
         OraQuery1.DisableControls;
        for i := 0 to DBGridEh1.SelectedRows.Count-1 do
          begin

         OraQuery1.GotoBookmark(TBookmark(DBGridEh1.SelectedRows[i]));
           Spisok:=oraQuery1.FieldByName('document_id').asString+','+spisok ;
          end;
        OraQuery1.EnableControls;
         delete(spisok,Length(spisok),1);
  Edit3.Text:=  Spisok;
      DBGridEh1DblClick(nil);
end;
 end;
 
procedure TForm27.OraQuery3CalcFields(DataSet: TDataSet);
var tx:string;
begin
  if Assigned(DataSet) and (DataSet.FindField('texkompl_sp')<> nil) then
    begin
tx:=' Select nomer from tx_texkompl ';
tx:=tx+' where texkompl_id in ( ';
tx:=tx+' Select texkompl_texkompl_id ';
tx:=tx+' from  tx_car_POTR ';
tx:=tx+' where ';
tx:=tx+' sprav_sprav_id='+OraQuery3.FieldByName('sprav_sprav_id').AsString;
tx:=tx+' and project_project_id= '+Edit1.text;
tx:=tx+' group by  texkompl_texkompl_id) ';
tx:=tx+' order by nomer ';
   OraQuery2.SQL.Text:=tx;
   OraQuery2.ExecSQL;

  if  OraQuery2.RecordCount>0 then
    begin
    OraQuery2.First;
      While OraQuery2.Eof=false   do
        begin
         OraQuery3.FieldByName('texkompl_sp').Value:=OraQuery3.FieldByName('texkompl_sp').asString+'  '+OraQuery2.FieldByName('nomer').AsString;
         OraQuery2.Next;
         end;
    end;


tx:=' Select (select ident from tronix.document where document_id=nnn) nomer,poz||'' ''||podpoz poz from tronix.sp ';
tx:=tx+' where nn in ( ';
tx:=tx+' Select sp_id_for ';
tx:=tx+' from  tx_car_POTR ';
tx:=tx+' where ';
tx:=tx+' sprav_sprav_id=' +OraQuery3.FieldByName('sprav_sprav_id').AsString;
tx:=tx+' and project_project_id= '+Edit1.text;
tx:=tx+' group by  sp_id_for) ';
tx:=tx+' order by nomer ';

   OraQuery2.SQL.Text:=tx;
   OraQuery2.ExecSQL;

  if  OraQuery2.RecordCount>0 then
    begin
    OraQuery2.First;
      While OraQuery2.Eof=false   do
        begin
         OraQuery3.FieldByName('chertezh_sp').Value:=OraQuery3.FieldByName('chertezh_sp').asString+' ; '+OraQuery2.FieldByName('nomer').AsString+' поз '+OraQuery2.FieldByName('poz').AsString;
         OraQuery2.Next;
         end;
    end;
 end;



end;

end.
