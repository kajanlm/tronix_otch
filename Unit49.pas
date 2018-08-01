unit Unit49;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExcelXP, OleServer, StdCtrls, ComCtrls,ComObj;

type
  TForm49 = class(TForm)
    ExcelWorksheet1: TExcelWorksheet;
    ExcelApplication1: TExcelApplication;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    procedure Otchet(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

   COLUM_PARAM,COLUM_NAME,TAB_COLUM_PARAM,HEAD_TEXT,TAB_COLUM_PARAM_ADD,COLUMN_PERENOS,TAB_STRING_BOLD: string;
   DATA: array of String;
   len_DATA:integer;

  end;

var
  Form49: TForm49;

implementation

{$R *.dfm}
////////////////////////////////////////////////////////////////////////////////////
//     len_DATA:=OraQuery3.RecordCount;
//     SetLength(DATA,len_DATA);
//      COLUM_PARAM:='30;15;112,86;8,29;9;20;END;'; ширина колонок по порядку
//      COLUM_NAME:='3;Номер ТК;1;12;Код;1;12;Наименование;1;12;Ед.Изм.;1;12;Количество;1;12;Признак;1;12;END;'; наименование колонок
//      TAB_COLUM_PARAM:='@;@;@;@;@;@;@'; так же по порядку формат колонок текст или цификрь
//      DATA[e]:= массив данных по строчкам через '|' разделитель
//      HEAD_TEXT Заголовок формат --  нач строка; размер шрифта; толстый; нач; кон ячейки для объеденения; Текст; Разделитель -- ;
//      HEAD_TEXT:='A1;20;true;A1;F2;Материалы с признаком поступления по '+OraQuery1.FieldByName('name').AsString+chr(13)+'Дата
//      TAB_COLUM_PARAM_ADD: параметры по колонкам:
//                                                 1.true -- выравнивание   VerticalAlignment    xlRight,  xlCenter или false
//                                                 2.true -- выравнивание                    xlRight,  xlCenter или false
//                                                 3.true -- перенос по словам
//                                                 4.true -- жирный текст
//      TAB_COLUM_PARAM_ADD:='true;true;true;no;true;true;true;no;true;true;true;no;true;true;true;no;true;true;true;no;true;true;true;no;true;true;true;no;';
//      COLUMN_PERENOS перенос по словам в заголовке COLUMN_PERENOS:='5;END' 5 -- номер колонки
//      TAB_STRING_BOLD='1;2;3;END' Толстый шрифт на строчки таблицы
/////////////////////////////////////////////////////////////////////////////////////

function ExtractWord(const AString: string; const ADelimiter: Char; const ANumber: integer): string;
var
  i, j, k: integer;
begin
  i := 1;
  k := 1;
  while k <> ANumber do
  begin
    if AString[i] = ADelimiter then
    begin
      Inc(k);
    end;
    Inc(i);
  end;
  j := i + 1;
  while (j <= Length(AString)) and (AString[j] <> ADelimiter) do
    Inc(j);
  Result := Copy(AString, i, j - i);
end;

procedure TForm49.Otchet(Sender: TObject);
var count,loc_count,kol_col,k, count1:integer;
FExcel, WorkBook, SheetActive, Sheet, Colum, Cell_1 : OleVariant;
begin
FExcel:=CreateOleObject('Excel.Application');
   FExcel.EnableEvents := False;
   FExcel.Visible:=false;
   FExcel.Workbooks.Add(-4167);
   FExcel.Workbooks[1].WorkSheets[1].Name:='Отчет';
   Colum:=FExcel.Workbooks[1].WorkSheets['Отчет'].Columns;
    Sheet:=FExcel.Workbooks[1].WorkSheets['Отчет'];
   count:=1;
           ProgressBar1.Max:=len_data;  Application.ProcessMessages;
     if ExtractWord(HEAD_TEXT,';',3)='true' then
     FExcel.Range[ExtractWord(HEAD_TEXT,';',1)].Font.Bold := true
    else
           FExcel.Range[ExtractWord(HEAD_TEXT,';',1)].Font.Bold:= false;
   FExcel.Range[ExtractWord(HEAD_TEXT,';',1)].Font.Size := StrToInt(ExtractWord(HEAD_TEXT,';',2));
   FExcel.Range[ExtractWord(HEAD_TEXT,';',1)]:=ExtractWord(HEAD_TEXT,';',6);

   FExcel.Range[ExtractWord(HEAD_TEXT,';',4),ExtractWord(HEAD_TEXT,';',5)].Select;
   FExcel.Selection.MergeCells:= True;
   FExcel.Selection.VerticalAlignment:=xlCenter;
   FExcel.Selection.HorizontalAlignment:=xlCenter;
   FExcel.Selection.WrapText:=True;
   FExcel.Selection.borders.weight:=2;
   FExcel.Selection.EntireRow.AutoFit;
  if COLUM_PARAM<>'' then
  While ExtractWord(COLUM_PARAM,';',count)<>'END' do
     begin
        Colum.Columns[Count].ColumnWidth:=StrToFloat(ExtractWord(COLUM_PARAM,';',count));
        count:=count+1;
     end;
  count:=2;  loc_count:=1;
  While ExtractWord(COLUM_NAME,';',count)<>'END' do
     begin
     if ExtractWord(COLUM_NAME,';',count+1)='1' then
      Sheet.Cells[StrToInt(ExtractWord(COLUM_NAME,';',1)),loc_count].Font.Bold := true
    else
         Sheet.Cells[StrToInt(ExtractWord(COLUM_NAME,';',1)),loc_count].Font.Bold := false;

       Sheet.Cells[StrToInt(ExtractWord(COLUM_NAME,';',1)),loc_count].Font.Size := StrToInt(ExtractWord(COLUM_NAME,';',count+2));
       Sheet.Cells[StrToInt(ExtractWord(COLUM_NAME,';',1)),loc_count]:=ExtractWord(COLUM_NAME,';',count);
       loc_count:=loc_count+1;
       count:=count+3;
     end;
       count:=StrToInt(ExtractWord(COLUM_NAME,';',1))+1;  
     if COLUMN_PERENOS<>'' then
       begin
          count1:=1;
  While ExtractWord(COLUMN_PERENOS,';',count1)<>'END' do
    begin
     Sheet.range[Sheet.cells[count-1,StrToInt(ExtractWord(COLUMN_PERENOS,';',count1))],Sheet.cells[count-1,StrToInt(ExtractWord(COLUMN_PERENOS,';',count1))]].WrapText:=True;
      inc(count1);
    end;
    end;//COLUMN_PERENOS
//     count:=StrToInt(ExtractWord(COLUM_NAME,';',1))+1;
    if loc_count>1 then
     Sheet.range[Sheet.cells[StrToInt(ExtractWord(COLUM_NAME,';',1)),1],Sheet.cells[StrToInt(ExtractWord(COLUM_NAME,';',1)),loc_count-1]].borders.weight:=3;
     kol_col:=loc_count;loc_count:=1;  //ShowMessage(IntTostr(kol_col)+' '+ExtractWord(DATA[0],';',2));
     k:=0;
      While (len_data)>k do
         begin
    While loc_count<kol_col do begin
    if   ExtractWord(TAB_COLUM_PARAM,';',loc_count)='@' then
          Sheet.Cells[count,loc_count].NumberFormat:= '@';

    //:='true;true;true;no;true;true;true;no;true;true;true;no;true;true;true;no;true;true;true;no;true;true;true;no;true;true;true;no;';


       if ExtractWord(TAB_COLUM_PARAM_ADD,';',4*(loc_count-1)+1)='up' then
             Sheet.Cells[count,loc_count].VerticalAlignment:=3 //-4152
        else if ExtractWord(TAB_COLUM_PARAM_ADD,';',4*(loc_count-1)+1)='centre' then
             Sheet.Cells[count,loc_count].VerticalAlignment:=2
         else  if ExtractWord(TAB_COLUM_PARAM_ADD,';',4*(loc_count-1)+1)='down' then
            Sheet.Cells[count,loc_count].VerticalAlignment:=1;


    if ExtractWord(TAB_COLUM_PARAM_ADD,';',4*(loc_count-1)+2)='xlRight' then
             Sheet.Cells[count,loc_count].HorizontalAlignment:=xlRight
         else if ExtractWord(TAB_COLUM_PARAM_ADD,';',4*(loc_count-1)+2)='xlLeft' then
             Sheet.Cells[count,loc_count].HorizontalAlignment:=xlLeft
         else  if ExtractWord(TAB_COLUM_PARAM_ADD,';',4*(loc_count-1)+2)='xlCenter' then
            Sheet.Cells[count,loc_count].HorizontalAlignment:=xlCenter;

         if ExtractWord(TAB_COLUM_PARAM_ADD,';',4*(loc_count-1)+3)='true' then
             Sheet.Cells[count,loc_count].EntireRow.AutoFit;
         if ExtractWord(TAB_COLUM_PARAM_ADD,';',4*(loc_count-1)+4)='true' then
             Sheet.Cells[count,loc_count].Font.Bold := true;

          Sheet.Cells[count,loc_count]:=ExtractWord(DATA[K],'|',loc_count);
          Sheet.Cells[count,loc_count].borders.weight:=2;
          loc_count:=loc_count+1;
    end;
          count:=count+1;
          loc_count:=1;
         k:=k+1;ProgressBar1.Position:=k;
         end;
         count1:=1;
      if  TAB_STRING_BOLD<>'' then
          While ExtractWord(TAB_STRING_BOLD,';',count1)<>'END' do
           begin
               Sheet.range[Sheet.cells[StrToInt(ExtractWord(TAB_STRING_BOLD,';',count1))+ StrToInt(ExtractWord(COLUM_NAME,';',1)),1],Sheet.cells[StrToInt(ExtractWord(TAB_STRING_BOLD,';',count1))+StrToInt(ExtractWord(COLUM_NAME,';',1)),kol_col]].Font.Bold:=True;
             count1:=count1+1;
           end;
       FExcel.Visible:=true;
       Form49.Close;
end;


end.
