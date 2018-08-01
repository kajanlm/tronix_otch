unit Unit50;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MemTableDataEh, Db, GridsEh, DBGridEh, MemTableEh, DBAccess,
  Ora, MemDS, DataDriverEh, DBSumLst, StdCtrls,Math, Menus,Registry,StrUtils,ComObj,
  Mask, DBCtrlsEh, DBLookupEh, ExcelXP, OleServer,JPEG,BarCodesUnit,
  ExtCtrls,ClipBrd;

type
  TForm50 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    MemTableEh1: TMemTableEh;
    DBGridEh1: TDBGridEh;
    DataSetDriverEh1: TDataSetDriverEh;
    OraQuery2: TOraQuery;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    OraQuery3: TOraQuery;
    OraDataSource2: TOraDataSource;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label1: TLabel;
    N2: TMenuItem;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure MemTableEh1CalcFields(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure MemTableEh1AfterPost(DataSet: TDataSet);
    procedure MemTableEh1AfterEdit(DataSet: TDataSet);
    procedure MemTableEh1BeforeEdit(DataSet: TDataSet);
    procedure MemTableEh1BeforePost(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure AutoSizeColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGridEh1ApplyFilter(Sender: TObject);
    procedure DBLookupComboboxEh1KeyValueChanged(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Print_naryad(Excel,exBook,exSh:OleVariant; e:integer);
  private
    { Private declarations }
    kof_change,kof_change1:real;
    working,s1,auto:integer;
    BmSave: TBookmark;
    value:string;
    ItWasActivated : boolean;
  public
    { Public declarations }
    Project_name:string;
    Project_id:string;
    Project_zak:string;
    Project_zavn:string;
  end;

var
  Form50: TForm50;

implementation

uses Unit49;

{$R *.dfm}

procedure TForm50.Print_naryad(Excel,exBook,exSh:OleVariant; e:integer);
var   SearchOptions: TLocateOptions;
JPEGImage : TJPEGImage;
WorkRg : ExcelRange;
Shp: Variant;
begin
  SearchOptions := [loPartialKey];

//exSh.Range['A1','AD60'].Copy(EmptyParam);
//exSh:=exBook.Worksheets[2]; //Активация первого листа рабочей книги
//exSh.Range['A1','AD60'].PasteSpecial(xlPasteColumnWidths,xlNone,False,False);
//exSh.Range['A1','AD60'].PasteSpecial(xlPasteRowHeights,xlNone,False,False);
//exSh.Range['A1','AD60'].PasteSpecial(xlPasteAll,xlNone,False,False);
//exSh.Range['A1','AD60'].PasteSpecial(xlPasteAllExceptBorders,xlNone,False,False);
//exSh.copy;
if e=1 then
 begin
exSh.copy(after:=exSh);
 exSh := exBook.Worksheets[1];
//exSh.name:=MemTableEh1.FieldByName('nomer').asString;
end;


  exSh.name:=MemTableEh1.FieldByName('nomer').asString;
  exSh.Range['L7']:=MemTableEh1.FieldByName('nomer').asString;   //Номер наряда
  exSh.Range['B10']:='ЦЕХ '+MemTableEh1.FieldByName('dep_dep_id_real').asString; // Цех

  exSh.Range['H24']:=MemTableEh1.FieldByName('razryd').asString;   //разряд
  exSh.Range['Z24']:=MemTableEh1.FieldByName('Vid_norm').asString; // вид норм
  exSh.Range['Z28']:=MemTableEh1.FieldByName('kod_tariff').asString;  //код тарифа
  exSh.Range['E30']:=MemTableEh1.FieldByName('dep_dep_id').asString;      //Исполниетль
  exSh.Range['B33']:=MemTableEh1.FieldByName('suma1').asString;     //количество часов
  exSh.Range['H20']:=MemTableEh1.FieldByName('prof').asString;     //код профессии
  exSh.Range['I8']:=Project_name;     //заказ
  exSh.Range['D8']:=Project_zavn;     //заказ
  exSh.Range['Y8']:=Project_zak;     //заказ
  exSh.Range['B22']:=MemTableEh1.FieldByName('profess').asString;  //название профессии
  exSh.Range['J33']:=MemTableEh1.FieldByName('stoimost').asString;  //стоимость
  exSh.Range['X5']:=MemTableEh1.FieldByName('date_dok').asString;  //дата наряда
  exSh.Range['Z26']:=MemTableEh1.FieldByName('Vid_oplaty').asString;  //вид оплаты
     // ShowMEssage(MemTableEh1.FieldByName('shtr').asString);  //Штрих-код)
//////////////////////////////////////////
/////////////////////////////////////////////
   DrawBarCode(Image1.Picture.Bitmap,Image1.Canvas.ClipRect,MemTableEh1.FieldByName('shtr').asString);
  JpegImage := TJpegImage.Create;
  JpegImage.Assign(Image1.Picture.Bitmap);
  Clipboard.Assign(JPEGImage);
  try
     begin
     if  e=1 then
       begin
  Shp :=  exSh.Shapes.Item(1);
  Shp.Delete;
       end;
    end;
FINALLY
 end;
 exBook.Activate; //Активация рабочей книги.
 exBook.Worksheets[1].Activate;
 exSh.Range['C47',EmptyParam].Select;
 exSh.PasteSpecial('Рисунок',False,false, EmptyParam,EmptyParam,EmptyParam, True);
// Image1.Picture.Bitmap.Free;
 // exSh.Range['B47'].Select;
 JpegImage.Free;
//////////////////////////////////////////
/////////////////////////////////////////////
   if   MemTableEh1.treelist.Locate('texkompl_id', MemTableEH1.FieldByName('texkompl_texkompl_id').asInteger, SearchOptions)= true then
    begin
     if MemTableEh1.TreeNodeLevel>1 then
        begin
      exSh.Range['B18']:=MemTableEh1.FieldByName('name').asString;
      exSh.Range['I16']:=MemTableEh1.FieldByName('Nomer').asString;
      exSh.Range['S10']:=MemTableEh1.FieldByName('dep_dep_id_real').asString;     //участок
      exSh.Range['J37']:=MemTableEh1.FieldByName('Pdate_beg').asString;     //Начло планируемая дата
      exSh.Range['T37']:=MemTableEh1.FieldByName('PDATE_END').asString;     //Окончание планируемая дата

      end;
      if MemTableEh1.TreeNodeLevel=1 then
       begin
      exSh.Range['B14']:=MemTableEh1.FieldByName('name').asString;
      exSh.Range['I12']:=MemTableEh1.FieldByName('Nomer').asString;
      exSh.Range['S10']:=MemTableEh1.FieldByName('dep_dep_id_real').asString;     //участок
       end;
    end
    else
      begin
        ShowMEssage('Error!!!');exit;
      end;

 MemTableEh1.treelist.Locate('texkompl_id', s1, SearchOptions);


  while MemTableEh1.TreeNodeLevel<>1 Do
    begin
   if   MemTableEh1.treelist.Locate('texkompl_id', MemTableEH1.FieldByName('texkompl_texkompl_id').asInteger, SearchOptions)= true
     then
       begin
         exSh.Range['B14']:=MemTableEh1.FieldByName('name').asString;
         exSh.Range['I12']:=MemTableEh1.FieldByName('Nomer').asString
       end;
       end;

 MemTableEh1.treelist.Locate('texkompl_id', s1, SearchOptions)
end;

procedure TForm50.FormShow(Sender: TObject);
var tx,SelfComplexName:string;
StringField :TStringField;
RegIniFile : TRegIniFile;
begin
 value:='1,6';
      auto:=0;
OraQuery1.Fields.Clear; ///Убрать
  MemTableEh1.Fields.Clear;

 With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'nomer';
    Size := 45  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

  With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'name';
    Size := 45  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

        With TFloatField.Create(OraQuery1) do
      begin
            FieldName := 'texkompl_id';
            DataSet:=OraQuery1;
            FieldKind:=fkDAta;
     end;

           With TFloatField.Create(OraQuery1) do
      begin
            FieldName := 'texkompl_texkompl_id';
            DataSet:=OraQuery1;
            FieldKind:=fkDAta;
     end;

          With TFloatField.Create(OraQuery1) do
     begin
            FieldName := 'trud';
            DataSet:=OraQuery1;
            FieldKind:=fkDAta;
     end;

     With TFloatField.Create(OraQuery1) do
     begin
              FieldName := 'trud_ok';
            DataSet:=OraQuery1;
            FieldKind:=fkDAta;
    end;

    With TStringField.Create(OraQuery1) do
     begin
              FieldName := 'type_tex_type_tex_id';
            DataSet:=OraQuery1;
            FieldKind:=fkDAta;
    end;

   With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'dep_dep_id';
    Size := 45  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;
  With  TFloatField.Create(OraQuery1) do
     begin
              FieldName := 'pz';
            DataSet:=OraQuery1;
            FieldKind:=fkDAta;
    end;

      With  TFloatField.Create(OraQuery1) do
     begin
              FieldName := 'podr';
            DataSet:=OraQuery1;
            FieldKind:=fkDAta;
    end;


             With TFloatField.Create(OraQuery1) do
      begin
            FieldName := 'sum1';
            DataSet:=OraQuery1;
            FieldKind:=fkCalculated;//fkInternalCalc;
     end;

                  With TFloatField.Create(OraQuery1) do
      begin
            FieldName := 'zopa';
            DataSet:=OraQuery1;
            FieldKind:=fkCalculated;//fkInternalCalc;
     end;

          With TFloatField.Create(OraQuery1) do
      begin
           FieldName := 'kof';
            DataSet:=OraQuery1;
            FieldKind:=fkDAta;//fkInternalCalc;
               ReadOnly:=false;
    end;
   With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'prof';
    Size := 45  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;
     With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'razryd';
    Size := 45  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;
   With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'Vid_norm';
    Size := 45  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;
   With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'kod_tariff';
    Size := 45  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

     With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'dep_dep_id_real';
    Size := 15  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

     With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'Pdate_beg';
    Size := 12  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;
       With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'PDATE_END';
    Size := 12  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

       With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'profess';
    Size := 40  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

       With TFloatField.Create(OraQuery1) do
   begin
    FieldName := 'stoimost';
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

       With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'date_dok';
    Size := 40  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

       With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'Vid_oplaty';
    Size := 2  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

      With TStringField.Create(OraQuery1) do
   begin
    FieldName := 'shtr';
    Size := 13  ;
      DataSet:=OraQuery1;
    FieldKind:=fkDAta;
  end;

 ///************************************************
  With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'nomer';
    Size := 45  ;
            DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;

  With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'name';
    Size := 45  ;
            DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;

        With TFloatField.Create(MemTableEh1) do
      begin
            FieldName := 'texkompl_id';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
     end;

           With TFloatField.Create(MemTableEh1) do
      begin
            FieldName := 'texkompl_texkompl_id';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
     end;

                 With TFloatField.Create(MemTableEh1) do
      begin
            FieldName := 'podr';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
     end;

          With TFloatField.Create(MemTableEh1) do
     begin
            FieldName := 'trud';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
     end;

     With TFloatField.Create(MemTableEh1) do
     begin
              FieldName := 'trud_ok';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
    end;

    With TStringField.Create(MemTableEh1) do
     begin
              FieldName := 'type_tex_type_tex_id';
            DataSet:=MemTableEh1;
            FieldKind:=fkDAta;
    end;

   With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'dep_dep_id';
    Size := 45  ;
   DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;
  With  TFloatField.Create(MemTableEh1) do
     begin
              FieldName := 'pz';
            DataSet:=MemTableEh1;;
            FieldKind:=fkDAta;
    end;



               With TFloatField.Create(MemTableEh1) do
      begin
            FieldName := 'suma1';
            DataSet:=MemTableEh1;
            FieldKind:=fkCalculated;//fkInternalCalc;
               ReadOnly:=false;
     end;
                    With TFloatField.Create(MemTableEh1) do
      begin
            FieldName := 'zopa';
            DataSet:=MemTableEh1;
            FieldKind:=fkCalculated;//fkInternalCalc;
               ReadOnly:=false;
     end;

                    With TFloatField.Create(MemTableEh1) do
      begin
            FieldName := 'kof';
            DataSet:=MemTableEh1;
            FieldKind:=fkData;;//fkInternalCalc;
               ReadOnly:=false;
     end;

        With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'prof';
    Size := 45  ;
   DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;
     With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'razryd';
    Size := 45  ;
   DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;
     With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'Vid_norm';
    Size := 45  ;
   DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;
     With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'kod_tariff';
    Size := 45  ;
   DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;

    With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'dep_dep_id_real';
    Size := 15  ;
   DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;


       With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'Pdate_beg';
    Size := 12  ;
   DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;

  With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'PDATE_END';
    Size := 12  ;
   DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;

    With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'profess';
    Size := 40  ;
   DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;


     With TFloatField.Create(MemTableEh1) do
   begin
    FieldName := 'stoimost';
   DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;

     With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'date_dok';
    Size := 40  ;
   DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;

      With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'Vid_oplaty';
    Size := 2  ;
   DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;

     With TStringField.Create(MemTableEh1) do
   begin
    FieldName := 'shtr';
    Size := 13  ;
   DataSet:=MemTableEh1;
    FieldKind:=fkDAta;
  end;
//****************GRID
 with dbGridEh1 do
   begin
    Width:=1120;
 end;

  with dbGridEh1.Columns.Add do
   begin
        FieldName := 'nomer';
   Title.Caption :='Номер';
    Width:=120;
   end;

  with dbGridEh1.Columns.Add do
   begin
    FieldName := 'name';
     Title.Caption:='Наименование';
    Width:=310;
  end;


 with dbGridEh1.Columns.Add do
     begin
    FieldName := 'trud';
     Title.Caption:='Норма';
    Width:=50;
     end;

 with dbGridEh1.Columns.Add do
     begin
    FieldName := 'trud_ok';
     Title.Caption:='Выполнено';
    Width:=50;
    end;



 with dbGridEh1.Columns.Add do
   begin
    FieldName := 'dep_dep_id';  ;
     Title.Caption:='Цех';
    Width:=300;
    ReadOnly:=true;
  end;

      With dbGridEh1.Columns.Add  do
     begin
    FieldName := 'type_tex_type_tex_id';
    Title.Caption:='Тип';
    Width:=50;
    end;

   with dbGridEh1.Columns.Add do
   begin
        FieldName :=  'zopa';
   Title.Caption :='Трудоемкость';
    Width:=70;
   end;
    with dbGridEh1.Columns.Add do
   begin
        FieldName := 'suma1';
   Title.Caption :='Закрыто по нар';
    Width:=70;
    ReadOnly:=false;
    STFILTER.visible:=false;
   end;

       with dbGridEh1.Columns.Add do
   begin
        FieldName := 'kof';
   Title.Caption :='коэф';
    Width:=70;
    ReadOnly:=false;
    STFILTER.visible:=false;
   end;


       with dbGridEh1.Columns.Add do
   begin
        FieldName := 'prof';
   Title.Caption :='Код Проф.';
    Width:=30;
    ReadOnly:=true;
    STFILTER.visible:=false;
   end;

       with dbGridEh1.Columns.Add do
   begin
        FieldName := 'razryd';
   Title.Caption :='Разряд';
    Width:=30;
    ReadOnly:=true;
    STFILTER.visible:=false;
   end;

       with dbGridEh1.Columns.Add do
   begin
        FieldName := ' Vid_norm';
   Title.Caption :='ВН';
    Width:=30;
    ReadOnly:=true;
    STFILTER.visible:=false;
   end;

       with dbGridEh1.Columns.Add do
   begin
        FieldName := 'kod_tariff';
   Title.Caption :='Код тар.ст.';
    Width:=30;
    ReadOnly:=true;
    STFILTER.visible:=false; 
   end;

      with dbGridEh1.Columns.Add do
  begin
       FieldName := 'dep_dep_id_real';
  Title.Caption :='Цех';
   Width:=15;
   ReadOnly:=true;
  STFILTER.visible:=true;
//  SetKeysFromListValues:='1,2,3';
  end;

// DbgridEh1.Columns[7].KeyList:=DBLookupComboboxEh1;


 SelfComplexName:='Gopnik';

if not ItWasActivated then begin // При первой активизации пишем в реестр
RegIniFile := TRegIniFile.Create('\SOFTWARE\'+ LeftStr(ExtractFileName(Application.ExeName),Pos('.',ExtractFileName(Application.ExeName))-1)
+'\GRIDS\DEFAULT\'+SelfComplexName, KEY_WRITE);
try
dbGridEh1.SaveGridLayout(RegIniFile);
finally
RegIniFile.Free;
end;
ItWasActivated := True
end;

RegIniFile := TRegIniFile.Create('\SOFTWARE\' // При любой активизации
+ LeftStr(ExtractFileName(Application.ExeName), // загружаем сохраненную
Pos('.',ExtractFileName(Application.ExeName))-1) // ранее конфигурацию
+'\GRIDS\LAST_WORKED\'+SelfComplexName, KEY_READ);

try
dbGridEh1.RestoreGridLayout(RegIniFile,[grpColIndexEh, grpColWidthsEh,
{ grpSortMarkerEh,} grpColVisibleEh,
grpRowHeightEh, grpDropDownRowsEh, grpDropDownWidthEh]);

finally
RegIniFile.Free;
end;



tx:=' Select null kof,nomer, name, texkompl_id,texkompl_texkompl_id,nordsy.SUM_TRUD(texkompl_id) trud,to_number(NORDSY.SUM_TRUD_PROF_TEXKOMPL(texkompl_id,0)) trud_ok, DECODE(type_tex_type_tex_id,7,''ТК'',''ПТК'') type_tex_type_tex_id, ';
tx:=tx+' (Select nomer from nordsy.dep d where d.dep_id=tx.dep_dep_id) as dep_dep_id,0 podr, ';
tx:=tx+'  0 pz,2 zopa, 0 suma, ';
tx:=tx+' '''' prof, '''' razryd ,''''  Vid_norm ,'''' kod_tariff, ';
tx:=tx+' (Select nomer from nordsy.dep d where d.dep_id=tx.dep_dep_id) as dep_dep_id_real, to_char(Pdate_beg,''DD-MM-YYYY'') Pdate_beg,to_char(PDATE_END,''DD-MM-YYYY'') PDATE_END, '''' profess, null stoimost,'''' date_dok, ''''  Vid_oplaty, '''' shtr ';
tx:=tx+' from tx_texkompl tx';
tx:=tx+' where type_tex_type_tex_id in (7,12) ';
tx:=tx+' connect by prior texkompl_id=texkompl_texkompl_id ';
tx:=tx+' start with texkompl_texkompl_id= ';
tx:=tx+' (Select texkompl_id from tx_texkompl where project_project_id='+Project_id+' and type_tex_type_tex_id=11 and texkompl_texkompl_id is null and nsort=1) ';
tx:=tx+' union all ';
tx:=tx+' Select 1 kof,nomer,decode(cadry_cadry_id_nar,null,(Select ident from tronix.firm where firm_id=post_post_id_nar),(Select fullname from nordsy.name where cadry_cadry_id=cadry_cadry_id_nar))  name, ';
tx:=tx+' ttn_id as texkompl_id, texkompl_texkompl_id_nar  as texkompl_texkompl_id,null trud,(Select trudoem from tronix.ttn_mat where ttn_ttn_id=ttn_id) trud_ok, ';
tx:=tx+' ''Наряд'' type_tex_type_tex_id, ';
tx:=tx+' decode(cadry_cadry_id_nar,null,(Select name from tronix.firm where firm_id=post_post_id_nar),(Select fullname from nordsy.name where cadry_cadry_id=cadry_cadry_id_nar))  as name, ';
tx:=tx+' decode(NVL(cadry_cadry_id_nar,0),0,1,2) podr, ';
tx:=tx+' DEcode(post_post_id_nar,null,1,2) as dep_dep_id,50 zopa, 0 summa , ';
tx:=tx+' (Select kod_prof from nordsy.kvalif where kvalif_id=(Select kvalif_kvalif_id from tronix.ttn_maT where ttn_ttn_id=ttn_id)) prof,(Select razryd from tronix.ttn_mat where ttn_ttn_id=ttn_id) razryd, ';
tx:=tx+' (Select kod from nordsy.vid_norm where vid_norm_id=(Select vid_norm_vid_norm_id from tronix.ttn_maT where ttn_ttn_id=ttn_id)) Vid_norm, ';
tx:=tx+' (Select kod from nordsy.vid_rabot where vid_rabot_id=(Select vid_rabot_vid_rabot_id from tronix.ttn_maT where ttn_ttn_id=ttn_id))||''''|| ';
tx:=tx+' (Select kod from nordsy.ysl_rabot where ysl_rabot_id=(Select ysl_rabot_ysl_rabot_id from tronix.ttn_maT where ttn_ttn_id=ttn_id)) as kod_tariff,';
tx:=tx+' (Select nomer from nordsy.dep d where d.dep_id=dep_dep_id_to) as dep_dep_id_real,'''' Pdate_beg,'''' PDATE_END, ';
tx:=tx+' (Select NAME from nordsy.kvalif where kvalif_id=(Select kvalif_kvalif_id from tronix.ttn_maT where ttn_ttn_id=ttn_id)) profess, ';
tx:=tx+'  (Select stoimost from tronix.ttn_maT where ttn_ttn_id=ttn_id) stoimost, to_char(date_dok,''DD-MM-YYYY'') date_dok, ';
tx:=tx+' (Select kod from nordsy.vid_oplaty where vid_oplaty_id=(Select vid_oplaty_vid_oplaty_id from tronix.ttn_maT where ttn_ttn_id=ttn_id)) Vid_oplaty, tronix.bar_code_assemble(ttn_id,''01'') shtr ';
tx:=tx+' from tronix.ttn ';
tx:=tx+' where ';
tx:=tx+'  texkompl_texkompl_id_nar in ';
tx:=tx+' (Select texkompl_id ';
tx:=tx+' from tx_texkompl ';
tx:=tx+' where type_tex_type_tex_id in (7,12) ';
tx:=tx+' connect by prior texkompl_id=texkompl_texkompl_id ';
tx:=tx+' start with texkompl_texkompl_id= ';
tx:=tx+' (Select texkompl_id from tx_texkompl where project_project_id='+Project_id+' and type_tex_type_tex_id=11 and texkompl_texkompl_id is null and nsort=1)) ';
tx:=tx+' and user_date2 is not null ';
tx:=tx+' order by nomer ';

OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;
  MemTableEh1.Open;

tx:='Select '' ВСЕ'' as nomer from dual ';
tx:=tx+' union all ';
tx:=tx+'Select nomer from ';
tx:=tx+' nordsy.dep d, ';
tx:=tx+' (Select Distinct dep_dep_id from tx_texkompl where  project_project_id=340 and type_tex_type_tex_id in (7,12)) tx ';
tx:=tx+' where d.dep_id=tx.dep_dep_id ';
tx:=tx+' and d.type_dep_type_dep_id in (2,4) ';
tx:=tx+' order by nomer ';

OraQuery3.SQL.Text:=tx;
OraQuery3.ExecSQL;
//lookupcomboboxEh1.DataList.SelectedIndex:=1;
//DBlookupcomboboxEh1.SelectNextValue(true);
      DBLookupComboBoxEh1.KeyValue:=' ВСЕ';

 // AutoSizeColumn;
end;

procedure TForm50.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
//if Column.Field.DataSet.FieldByName('pz').AsFloat=2 then
//if Column.Field.DataSet.FieldByName('type_tex_type_tex_id').AsString='Наряд' then
if DBGridEh1.DataSource.DataSet.FieldByName('pz').AsFloat=2 then
 //if Column.FieldName = 'pz' then
 // if (Column.Field.AsInteger = 2) then
 Background:=clLtGray;// clTeal;


// if  column.FieldName='suma1' then
 //  if ((DbgridEh1.DataSource.DataSet.FieldByName('type_tex_type_tex_id').AsString='ТК') or
 //  (DbgridEh1.DataSource.DataSet.FieldByName('type_tex_type_tex_id').AsString='ПТК'))
 //  and
 //   (DbgridEh1.DataSource.DataSet.FieldByName('suma1').value-DbgridEh1.DataSource.DataSet.FieldByName('trud').value>0)
  //    then   Background:=clSkyBlue;




end;



procedure TForm50.MemTableEh1CalcFields(DataSet: TDataSet);
var temp:real;
begin
//   SetRoundMode(rmUp);
if (DBGRIDEH1.DataSource.DataSet.FieldByName('type_tex_type_tex_id').asString='Наряд') then

if (DBGRIDEH1.DataSource.DataSet.FieldByName('podr').asFloat=1) and (DBGRIDEH1.DataSource.DataSet.FieldByName('suma1').ASFloat=0)
 then

DBGRIDEH1.DataSource.DataSet.FieldByName('suma1').ASFloat:=RoundTo(DBGRIDEH1.DataSource.DataSet.FieldByName('trud_ok').AsFloat*
DBGRIDEH1.DataSource.DataSet.FieldByName('kof').asfloat,-2)
else
 DBGRIDEH1.DataSource.DataSet.FieldByName('suma1').ASFloat:=DBGRIDEH1.DataSource.DataSet.FieldByName('trud_ok').AsFloat;

if  (DBGRIDEH1.DataSource.DataSet.FieldByName('type_tex_type_tex_id').asString<>'Наряд')
then
    begin

    temp:=DBGRIDEH1.DataSource.DataSet.FieldByName('trud_ok').ASFloat+ //ShowMEssage(DBGRIDEH1.DataSource.DataSet.FieldByName('kof').asString);
    DBGRIDEH1.DataSource.DataSet.FieldByName('kof').asfloat;
DBGRIDEH1.DataSource.DataSet.FieldByName('suma1').ASFloat:=temp;
DBGRIDEH1.DataSource.DataSet.FieldByName('zopa').ASFloat:= DBGRIDEH1.DataSource.DataSet.FieldByName('trud').ASFloat+ DBGRIDEH1.DataSource.DataSet.FieldByName('kof').asfloat;
       end;

end;





procedure TForm50.Button1Click(Sender: TObject);
var f: textfile;
texkompl_id1,to_file:string;
RecordsView: TRecordsViewEh;
  i: Integer;
  v,v1: Variant;
begin
  SaveDialog1.Filter:=Project_name+'|*.'+Project_id;
if SaveDialog1.Execute then
begin
AssignFile(F,SaveDialog1.FileName);
Rewrite(F);
begin
 DBGridEh1.DataSource.DataSet.Filtered:=false;
  for i:= 0 to MemTableEh1.RecordsView.MemTableData.RecordsList.Count-1 do
  begin

  if NOT VarIsNull(MemTableEh1.RecordsView.MemTableData.RecordsList[i].
     DataValues['kof', dvvValueEh]) then
        begin
    v:= MemTableEh1.RecordsView.MemTableData.RecordsList[i].
      DataValues['texkompl_id', dvvValueEh];
    v1:= MemTableEh1.RecordsView.MemTableData.RecordsList[i].
      DataValues['kof', dvvValueEh];
     v:=FloatToStr(v);
     v1:=FloatToStr(v1);
      to_file:=v+';'+(v1);
   if (v1<>1) and (MemTableEh1.RecordsView.MemTableData.RecordsList[i].
      DataValues['pz', dvvValueEh])=2 then
    writeLn(f,to_file);
    end;
 end;
end;
    DBGridEh1.DataSource.DataSet.Filtered:=true;
  closefile(f);

end;



end;

procedure TForm50.MemTableEh1AfterPost(DataSet: TDataSet);
var VarValue,SValue,lookup: Variant;
 e,delta:real;
   SearchOptions: TLocateOptions;
begin
  // DBGridEh1.DataSource.DataSet.Filtered:=false;
  SearchOptions := [loPartialKey];
   Working:=1;
   if   MemTableEh1.treelist.Locate('texkompl_id', MemTableEH1.FieldByName('texkompl_texkompl_id').asInteger, SearchOptions)= true
 then  begin
    e:=DBGRIDEH1.DataSource.DataSet.FieldByName('kof').asFloat;//ShowMEssage('e '+Floattostr(e)+' kof '+ Floattostr(kof_change)+' kof1 '+ Floattostr(kof_change1));
   DBGRIDEH1.DataSource.DataSet.EDIT;
  // SetRoundMode(rmUp);
   delta:= RoundTo(e+kof_change-kof_change1,-2);
 // SetRoundMode(rmUp);
 // delta:= RecordRound('rmUp #2', e+kof_change-kof_change1);
   DBGRIDEH1.DataSource.DataSet.FieldByName('kof').value:=delta; // ShowMEssage(Floattostr(e)+' есть '+ Floattostr(kof_change)+'  bnju '+FloatToStr(e+kof_change));

   DBGRIDEH1.DataSource.DataSet.POst;
     end
  else

    MemTableEH1.TreeList.Locate('texkompl_id',s1,[]);

   //   DBGridEh1.DataSource.DataSet.Filtered:=true;
end;

procedure TForm50.MemTableEh1AfterEdit(DataSet: TDataSet);
begin
//kof_change:=MemTableEH1.FieldByName('suma1').Value-MemTableEH1.FieldByName('trud_ok').Value;ShowMessage(FloatTostr(kof_change));
end;

procedure TForm50.MemTableEh1BeforeEdit(DataSet: TDataSet);
begin

if working=0 then
  kof_change1:=MemTableEH1.FieldByName('suma1').Value-MemTableEH1.FieldByName('trud_ok').Value;//ShowMessage(FloatTostr(kof_change1)+' Work '+IntTostr(working));
end;

procedure TForm50.MemTableEh1BeforePost(DataSet: TDataSet);
begin
if working=0 then
  kof_change:=MemTableEH1.FieldByName('suma1').Value-MemTableEH1.FieldByName('trud_ok').Value;//ShowMessage(FloatTostr(kof_change));
end;

procedure TForm50.N1Click(Sender: TObject);
var
i,Level_up,k,start_tx:integer;
 SearchOptions: TLocateOptions;
begin

  SearchOptions := [loPartialKey];


 if auto=0 then
   begin
 repeat
value:=InputBox('ВВЕДИТЕ ПОПРАВКУ', 'Пожалуйста, цифири', value);
  until value <> '';
 try StrToFloat(value);
 except
   begin
   MessageDlg('ВВЕДЕНО НЕ ЦИСЛО!!! ', mtWarning, [mbOk], 0);
   exit;
   end;
  end;
  if StrToFloat(value)<=0 then
  begin
     MessageDlg('Прикольный коэфициент!!! ', mtWarning, [mbOk], 0);
     exit;

   end;
    end;


    k:=0; //DBGridEH1.SelectedRows[0];
   //   DBGridEH1.DataSource.DataSet.DisableControls;
// While i<DBGridEH1.SelectedRows.Count Do
//  begin
    Level_up:=MemTableEh1.TreeNodeLevel;
    start_tx:=MemTableEh1.FieldByName('texkompl_id').asInteger;
    if MemTableEh1.TreeNodeHasChildren=true
      then
        begin
    if MemTableEh1.TreeNodeExpanded=false then
     MemTableEh1.TreeNodeExpanded:=true;
      MemTableEh1.Next;
      end
     else
       if MemTableEh1.FieldByName('pz').asinteger=2 then
                         begin
           working:=0;
      s1:=MemTableEh1.FieldByName('texkompl_id').asInteger;
      DBGRIDEH1.DataSource.DataSet.EDIT;
      DBGRIDEH1.DataSource.DataSet.FieldByName('kof').Value:=value;
      DBGRIDEH1.DataSource.DataSet.POst;
                 end;


     While MemTableEh1.TreeNodeLevel>Level_up Do
       begin
        if MemTableEh1.TreeNodeExpanded=false then
          begin
          MemTableEh1.TreeNodeExpanded:=true;
           k:=1;
          end;
       if MemTableEh1.FieldByName('pz').asinteger=2 then
                 begin
           working:=0;
      s1:=MemTableEh1.FieldByName('texkompl_id').asInteger;
      DBGRIDEH1.DataSource.DataSet.EDIT;
      DBGRIDEH1.DataSource.DataSet.FieldByName('kof').Value:=value;
      DBGRIDEH1.DataSource.DataSet.POst;
                 end;
           k:=0;
       MemTableEh1.Next;
       end;
      if MemTableEh1.Locate('texkompl_id',start_tx, SearchOptions)<> true then ShowMessage('Ythgtldbltyyfz jib,rf');
//  inc(i);
//end;
 // DBGridEH1.DataSource.DataSet.Bookmark:=DBGridEH1.SelectedRows[0];
// DBGridEH1.SelectedRows.Clear;
     //   DBGridEH1.DataSource.DataSet.EnableControls;


end;


procedure TForm50.AutoSizeColumn;
var
  i: Integer;
begin
    for i:=0 to DBGridEh1.Columns.Count-1 do
      DBGridEh1.Columns[i].OptimizeWidth;
end;

procedure TForm50.FormClose(Sender: TObject; var Action: TCloseAction);
var
RegIniFile : TRegIniFile;
SelfComplexName:String;
begin
SelfComplexName:='Gopnik';
RegIniFile := TRegIniFile.Create('\SOFTWARE\' // При дезактивации
+ LeftStr(ExtractFileName(Application.ExeName), // сохраняем конфигурацию
Pos('.',ExtractFileName(Application.ExeName))-1)
+'\GRIDS\LAST_WORKED\'+SelfComplexName, KEY_WRITE);

try
dbGridEH1.SaveGridLayout(RegIniFile)
finally
RegIniFile.Free;
end;
end;

procedure TForm50.Button2Click(Sender: TObject);
var buttonSelected : Integer;
fl,st:string;
TextF:textFile;
SearchOptions: TLocateOptions;
begin

  SearchOptions := [loPartialKey];

  buttonSelected := MessageDlg('POZOR!!!!! Все данные введеные будут не сохранены',mtError, mbOKCancel, 0);
   if buttonSelected = mrCancel then exit;
  if buttonSelected = mrOK     then
    begin
   //  openDialog1.InitialDir := GetCurrentDir;
     openDialog1.Filter:= Project_name+'|*.'+Project_id;
  //  openDialog1.Options := [ofFileMustExist];



         if openDialog1.Execute
               then
                 begin
          //     ShowMessage('File : '+openDialog1.FileName);
               //**********************  Чистим коэфициенты
                   auto:=1;
                   DBGridEh1.DataSource.DataSet.Filtered:=false;

                    MemTableEh1.TreeList.FullCollapse;
                             MemTableEh1.First;
          //   DBGRIDEH1.DataSource.DataSet.DisableControls;
        //       MemTableEh1.TreeNodeExpanded:=true;
                DBGRIDEH1.DataSource.DataSet.First;

              While   NOT DBGRIDEH1.DataSource.DataSet.Eof Do
               begin
           //    ShowMEssage(FloatToStr(DbgridEh1.DataSource.DataSet.FieldByName('zopa').value-DbgridEh1.DataSource.DataSet.FieldByName('trud').value));
                if (DbgridEh1.DataSource.DataSet.FieldByName('zopa').value-DbgridEh1.DataSource.DataSet.FieldByName('trud').value<>0) // and
          //   if   (DBGridEh1.DataSource.DataSet.FieldByName('type_tex_type_tex_id').AsString='Наряд')
               then begin
                  MemTableEh1.TreeNodeExpanded:=false;
                value:='1';  //SHowMessage('!!!!');
                  Form50.N1Click(nil);
                  MemTableEh1.TreeNodeExpanded:=false;
                 end; 
                  DBGRIDEH1.DataSource.DataSet.Next;

                  end;
    //    MemTableeh1.Refresh;

               //*****************************
              // Втягиваем данные!!!!!
                 DBGRIDEH1.DataSource.DataSet.First;
               AssignFile(TextF, openDialog1.FileName);
          //     ShowMEssage(openDialog1.FileName);
               reset(TextF);
               {$I-}
                  if IOResult<>0 then
                         begin
                           ShowMessage('Ошибка открытия файла ');
                           Exit;
                         end;
               {$I+}     //        DBGRIDEH1.DataSource.DataSet.EnableControls;
               While not EOF(TextF) do
                   begin
                      ReadLn(TextF,st);         
             //         ShowMEssage(Copy(st,1,Pos(';',st)-1));
            //          ShowMEssage(Copy(st,Pos(';',st)+1,Length(st)));
                        if MemTableEh1.TreeList.Locate('texkompl_id',Copy(st,1,Pos(';',st)-1), SearchOptions)= true then
                          begin
                           value:=Copy(st,Pos(';',st)+1,Length(st));
                            Form50.N1Click(nil);
                          end
                          else
                          ShowMessage('Хм не могу найти наряд!');


                    end;
               //            DBGRIDEH1.DataSource.DataSet.EnableControls;
              CloseFile(TextF); // закрыть файл
                                     DBGridEh1.DataSource.DataSet.Filtered:=true;




               //*****************************
             //   DBGRIDEH1.DataSource.DataSet.EnableControls;
                 end
               else MessageDlg('Файл не загружен!',mtInformation, [mbYes],0);
    end;
   auto:=0;
end;

procedure TForm50.Button3Click(Sender: TObject);
var
t,t1:integer;
begin
  Application.CreateForm(TForm49, Form49);
    Form49.Caption:='Готовлю отчет!';
    Form49.Show();
 With Form49 Do
   Begin

   HEAD_TEXT:='A1;20;true;A1;F2;Построечный журнал';
    TAB_COLUM_PARAM:='@;@;@;@;@;@;@;@;END';
    COLUM_NAME:='3;Номер;1;12;ПУЕ;1;12;Номер;1;12;Наименование;1;12;Шифр професии;1;12;Разряд;1;12;Норма;1;12;Выполнено;1;12;END;';
    COLUMN_PERENOS:='5;4;END';
    COLUM_PARAM:='4;9;20,65;65,9;12;20;8;8;END;';
    TAB_COLUM_PARAM_ADD:='centre;xlLeft;true;no;centre;xlCenter;true;no;centre;xlLeft;true;no;down;xlRight;true;no;up;xlCenter;true;no;centre;xlRight;true;true;centre;xlCenter;true;true;up;xlCenter;true;no;up;xlCenter;true;no';
    MemTAbleEh1.TreeList.FullExpand;
//    SetLength(DATA,1);  DATA[0]:= '1|2|3|4|5|6|7';
   SetLength(DATA,MemTAbleEh1.RecordCount);
   len_DATA:=MemTAbleEh1.RecordCount;
    t:=0;
    t1:=1;
    TAB_STRING_BOLD:='';
       MemTAbleEh1.First;DbgridEh1.DataSource.DataSet.DisableControls;
    While NOT  MemTAbleEh1.Eof=true Do
      begin
      if  (memTableEh1.FieldByName('type_tex_type_tex_id').AsString='ТК')  or (memTableEh1.FieldByName('type_tex_type_tex_id').AsString='ПТК')
         then
     begin
    DATA[t]:=IntToStr(t1)+'|'+
    memTableEh1.FieldByName('type_tex_type_tex_id').AsString+'|'+
    memTableEh1.FieldByName('nomer').AsString+'|'+
    memTableEh1.FieldByName('name').AsString+'| | |';
    TAB_STRING_BOLD:=TAB_STRING_BOLD+';'+InttoStr(t+1);
     if memTableEh1.FieldByName('zopa').AsString='' then
      begin
       DATA[t]:=DATA[t]+memTableEh1.FieldByName('trud').AsString+'|';
       DATA[t]:=DATA[t]+memTableEh1.FieldByName('trud_ok').AsString;
       end
      else
        begin
       DATA[t]:=DATA[t]+memTableEh1.FieldByName('zopa').AsString+'|';
          DATA[t]:=DATA[t]+memTableEh1.FieldByName('suma1').AsString;
       end;
    end
    Else
      begin
        DATA[t]:='| | |'+
    memTableEh1.FieldByName('type_tex_type_tex_id').AsString+' '+memTableEh1.FieldByName('nomer').AsString+'|'+
    memTableEh1.FieldByName('prof').AsString+'|'+
    memTableEh1.FieldByName('razryd').AsString+'|  |';
    DATA[t]:=DATA[t]+memTableEh1.FieldByName('suma1').AsString;
    t1:=t1-1;
       end;
    t:=t+1;
    t1:=t1+1;
     memTableEh1.Next;
    end;
    DELETE(TAB_STRING_BOLD,1,1);
    if TAB_STRING_BOLD<>'' then
     TAB_STRING_BOLD:=TAB_STRING_BOLD+';END';
  Otchet(Nil);
  MemTAbleEh1.TreeList.FullCollapse;
  DbgridEh1.DataSource.DataSet.EnableControls;
   end;




end;

procedure TForm50.DBGridEh1ApplyFilter(Sender: TObject);
begin
   DBGridEh1.DataSource.DataSet.Filtered:=false;
  if Copy(DBGridEh1.Columns[13].STFilter.ExpressionStr,1,1)='0' then
    DBGridEh1.DataSource.DataSet.Filter:=DBGridEh1.Columns[13].FieldName+' like '+#39+Copy(DBGridEh1.Columns[13].STFilter.ExpressionStr,2,1)+'%%'#39
    else
  DBGridEh1.DataSource.DataSet.Filter:=DBGridEh1.Columns[13].FieldName+' like '+#39+DBGridEh1.Columns[13].STFilter.ExpressionStr+'%%'#39;

 if  Copy(DBGridEh1.Columns[13].STFilter.ExpressionStr,1,2)='01' then
//    DBGridEh1.DataSource.DataSet.Filter:=DBGridEh1.Columns[3].FieldName+' like '+#39+Copy(DBGridEh1.Columns[3].STFilter.ExpressionStr,2,1)+'%%'#39
SHowMessage(DBGridEh1.DataSource.DataSet.Filter);

  DBGridEh1.DataSource.DataSet.Filtered:=true;
end;

procedure TForm50.DBLookupComboboxEh1KeyValueChanged(Sender: TObject);
var tx,Fil:string;
begin

//     ShowMessage(DBlookupComboBoxEh1.KeyValue);
  if DBlookupComboBoxEh1.KeyValue=' ВСЕ' then  DBGridEh1.DataSource.DataSet.Filtered:=false
else
begin
tx:='Select nomer from ';
tx:=tx+' nordsy.dep ';
tx:=tx+' where dep_dep_id = ';
tx:=tx+' (Select dep_id from nordsy.dep ';
tx:=tx+' where nomer='''+DBlookupComboBoxEh1.KeyValue+''')';
tx:=tx+' and ';
tx:=tx+' dep_id = ';
tx:=tx+' (Select Distinct dep_id from tx_texkompl where  project_project_id=340 and type_tex_type_tex_id in (7,12)) ';
tx:=tx+' and type_dep_type_dep_id in (2,3) ';
tx:=tx+' union all ';
tx:=tx+' Select nomer from ';
tx:=tx+' nordsy.dep ';
tx:=tx+' where dep_id = ';
tx:=tx+' (Select dep_id from nordsy.dep ';
tx:=tx+' where nomer='''+DBlookupComboBoxEh1.KeyValue+''')';
    //   ShowMEssage(tx);
OraQuery2.SQL.Text:=tx;
OraQuery2.ExecSQL;
  If OraQuery2.RecordCount>0 Then
    Begin
     fil:=' in (';
     OraQuery2.First;
      While Not OraQuery2.Eof Do
          begin
          fil:=fil+chr(39)+OraQuery2.FieldByName('NOMER').AsString+''',';
          OraQuery2.Next;
          end;
      Delete(fil,Length(fil),Length(fil));
      fil:=fil+')';
       DBGridEh1.DataSource.DataSet.Filter:=DBGridEh1.Columns[13].FieldName+fil;
       DBGridEh1.DataSource.DataSet.Filtered:=true;
    end;
  end;
end;

procedure TForm50.N2Click(Sender: TObject);
var tx:string;
i,Level_up,k,start_tx,e:integer;
 SearchOptions: TLocateOptions;
 var Excel,exBook,exSh : OleVariant;
FileName:string;
 begin




     FileName:='C:\Наряд.xls';
     e:=0;
Excel:= CreateOleObject('Excel.Application');
 exBook := Excel.Workbooks.Open(FileName:=FileName);
 exSh := exBook.Worksheets[1];
Excel.Visible := True;
exBook.Activate; //Активация рабочей книги.
exBook.Worksheets[1].Activate; //Активация первого листа рабочей книги

      Level_up:=MemTableEh1.TreeNodeLevel;
    start_tx:=MemTableEh1.FieldByName('texkompl_id').asInteger;
    if MemTableEh1.TreeNodeHasChildren=true
      then
        begin
    if MemTableEh1.TreeNodeExpanded=false then
     MemTableEh1.TreeNodeExpanded:=true;
      MemTableEh1.Next;
      end
     else
       if MemTableEh1.FieldByName('pz').asinteger=2 then
                         begin
           working:=0;
      s1:=MemTableEh1.FieldByName('texkompl_id').asInteger;
      Print_naryad(Excel,exBook,exSh,0);
                 end;

          While MemTableEh1.TreeNodeLevel>Level_up Do
       begin
        if MemTableEh1.TreeNodeExpanded=false then
          begin
          MemTableEh1.TreeNodeExpanded:=true;
           k:=1;
          end;
       if MemTableEh1.FieldByName('pz').asinteger=2 then
                 begin
           working:=0;
      s1:=MemTableEh1.FieldByName('texkompl_id').asInteger;
      Print_naryad(Excel,exBook,exSh,e);e:=1;
                 end;
           k:=0;
       MemTableEh1.Next;
       end;

end;

end.
