unit Unit34;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, DBAccess, Ora, MemDS, StdCtrls, OraSmart,
  Grids, ComObj, EhLibADO;

type
  TForm34 = class(TForm)
    Button1: TButton;
    OraQuery1: TOraQuery;
    OraQuery3: TOraQuery;
    Button2: TButton;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    StringGrid1: TStringGrid;
    Button3: TButton;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Label2: TLabel;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    Edit2: TEdit;
    Button5: TButton;
    Label4: TLabel;
    Button6: TButton;
    CheckBox3: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
      Form34: TForm34;
        MsProjectApp: Variant;
      function check_vn(iz,v:string; vari:Variant):integer;
      function check_svayz_vn(iz,v:integer;vari:variant):integer;
implementation

uses Unit9;

{$R *.dfm}

function check_svayz_vn(iz,v:integer;vari:variant):integer;
var
sv:Variant;
k3,k2: Integer;

begin
        k3:=0;
         sv:=vari.Application.ActiveProject.Tasks(v).OutlineParent.OutlineChildren;
            k2:=1;
            while k2<=sv.count do
              begin
                if sv.item[k2].id=iz
                   then k3:=1;  //ShowMessage(IntTostr(k3)+' '+INtToStr(sv.item[k2].id)+' '+IntToStr(iz));
                   k2:=k2+1;
              end;

  if k3=1 then result:=1 else result:=0;
    //           ShowMessage(k3);
end;

function check_vn(iz,v:string ;vari:Variant):integer;
var sv:Variant;
q1,r:integer;
begin

        q1:=1;   r:=0;
         while vari.Application.ActiveProject.Tasks(v).TaskDependencies.count>=q1 do
             begin
               if vari.Application.ActiveProject.Tasks(vari.Application.ActiveProject.Tasks(v).TaskDependencies.item[q1].to.name).OutlineParent.name
               <>vari.Application.ActiveProject.Tasks(iz).Name
                   then
                   begin
                    r:=1 ;
          //       ShowMessage(vari.Application.ActiveProject.Tasks(v).name+' '+vari.Application.ActiveProject.Tasks(v).TaskDependencies.item[q1].to.name);
                  end;
                q1:=q1+1;
             end;
     //  ShowMessage(iz+' '+v+' результат '+inttostr(r));
 if r<>1 then result:=0 else result:=1

end;

procedure TForm34.FormShow(Sender: TObject);
var tx:string;
begin

end;

procedure TForm34.Button1Click(Sender: TObject);
var tx:string;
  r ,ts,me, r1: Variant;
    MsProjectApp: Variant;
  Task : Variant;
  k,e,poz,k2:integer;
 name,typ,k3 :string ;


begin

   MsProjectApp := CreateOleObject('MSProject.Application');
      MsProjectApp.Application.FileNew;
 //     currProject = MSProjectApp.ActiveProject;


       //  MsProjectApp.Application.SetTitle3:=strtodate('14.07.2014');
//  MsProjectApp.Application.ProjectSummaryInfo.Start:=('Пн 11.08.14');
   Task := MsProjectApp.Application.ActiveProject.Tasks.Add('100');
       Task := MsProjectApp.Application.ActiveProject.Tasks.Add('200');
     Task := MsProjectApp.Application.ActiveProject.Tasks.Add('2.1');
       MsProjectApp.Application.activeproject.Tasks('2.1').Outlineindent;
       Task := MsProjectApp.Application.ActiveProject.Tasks.Add('2.2');
          Task := MsProjectApp.Application.ActiveProject.Tasks.Add('2.3');
       Task := MsProjectApp.Application.ActiveProject.Tasks.Add('101');
        MsProjectApp.Application.activeproject.Tasks('101').Outlineoutdent;
       Task := MsProjectApp.Application.ActiveProject.Tasks.Add('104');
              Task := MsProjectApp.Application.ActiveProject.Tasks.Add('103');
      //        Task.Start := strtodate('14.07.2014');
             task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Number1'), 5);
  //          ИмяТаблицы = "&Ввод";
         Task := MsProjectApp.Application.ActiveProject.Tasks.Add('207');
              Task := MsProjectApp.Application.ActiveProject.Tasks.Add('203');
                     Task := MsProjectApp.Application.ActiveProject.Tasks.Add('202');
              Task := MsProjectApp.Application.ActiveProject.Tasks.Add('201');

//ПозицияКолонки = 2;
//ТипПоля = "Текст1";
//MSProject.Application.TableEditEx(ИмяТаблицы,True,create,,,, ТипПоля ,"Представление колонки",,,,,,,  ПозицияКолонки ,,,,,);

//MSProjectApp.Application.TableEditEx('Usage',True,,,,, 'Number1' ,'КАКА',,,,,,,  2 ,,,,,);

name:= 'Таблица Сведения';
poz:=2;
typ:='Text1';
MSProjectApp.Application.TableEditEx('Таблица Сведения',True,,,,, 'Text1' ,'МОЯ',,,,,,,  2 ,,,,,);

MSProjectApp.Application.TableApply( 'Таблица Сведения');
       task.SetField(MsProjectApp.Application.FieldNameToFieldConstant(typ), '5');
         k:=1;e:=1;
        if CheckBox2.Enabled=true then
        begin
          While   k<=MsProjectApp.Application.ActiveProject.Tasks.Count do
            begin
            r:= MsProjectApp.Application.ActiveProject.Tasks(k);
        //    if  r.Summary=true then showMessage('УРА!!! '+MsProjectApp.Application.ActiveProject.Tasks(k).name+' '+IntToStr(r.OutlineLevel));
            if   r.OutlineLevel=1 then
               if r.Summary=true then
               begin
                ts:=r.OutlineChildren ;
                while  e<=ts.Count do
                   begin
          //    ShowMessage( ts.item[e].name);
              e:=e+1;
                  end;
               end;
         //    ShowMessage(MsProjectApp.Application.ActiveProject.Tasks(k).name+' '+IntToStr(r.OutlineLevel));

              k:=k+1;
          end;
        end;
        MsProjectApp.Application.ActiveProject.Tasks(6).TaskDependencies.Add(MsProjectApp.Application.ActiveProject.Tasks(8));
                MsProjectApp.Application.ActiveProject.Tasks(6).TaskDependencies.Add(MsProjectApp.Application.ActiveProject.Tasks(11));
         MsProjectApp.Application.ActiveProject.Tasks(6).TaskDependencies.Add(MsProjectApp.Application.ActiveProject.Tasks(3));
                  MsProjectApp.Application.ActiveProject.Tasks(5).TaskDependencies.Add(MsProjectApp.Application.ActiveProject.Tasks(3));
                           MsProjectApp.Application.ActiveProject.Tasks(10).TaskDependencies.Add(MsProjectApp.Application.ActiveProject.Tasks(3));
           MsProjectApp.Application.ActiveProject.Tasks(1).TaskDependencies.Add(MsProjectApp.Application.ActiveProject.Tasks(3));
        me:=MsProjectApp.Application.ActiveProject.Tasks('2.1').TaskDependencies;

  //     MSProjectApp.ViewEditSingle('My New View', true, EmptyParam, 1,true, false, 'Таблица Сведения', 'Все задачи',  EmptyParam);
 //      MSProjectApp.ViewApplyEx('Диаграмма ганта', EmptyParam, EmptyParam, 0);
//    MSProjectApp.FilterEdit('New Filter', true, true, true, EmptyParam, EmptyParam,'Name', EmptyParam,'contains', '10', EmptyParam, true, true);
//    MSProjectApp.FilterApply('New Filter');
//     MSProjectApp.Sort('Name', EmptyParam, EmptyParam,EmptyParam, EmptyParam, EmptyParam, true, true);
//    MSProjectApp.FilterApply('Все задачи');
//         MSProjectApp.Sort('Name', EmptyParam, EmptyParam,EmptyParam, EmptyParam, EmptyParam, true, true);

//             MsProjectApp.Application.ActiveProject.Tasks(2);
               // r1.OutlineParent;
           //      r1:=MsProjectApp.Application.ActiveProject.Tasks(2).OutlineParent.OutlineChildren;
      if   check_svayz_vn(10,3,MsProjectApp)=1 then
               ShowMessage('1');
       MsProjectApp.Application.visible:=true;

 end;

procedure TForm34.Button2Click(Sender: TObject);
var tx,tx1:string;
  MsProjectApp : Variant;
  Task,r,ts , k2: Variant; //k2,k3 k4 уьбит
  q,k,k1,i,res_max,test,e,delta,q1,delta1,k3:integer;
  vol1,vol2,name,res, Etap_of_real,k1_t,k4:string;
  TaskDep:array[1..10] of string[10];
begin
  try
    MsProjectApp := CreateOleObject('MSProject.Application');
  except
    ShowMessage('Не удалось открыть MS Project');
    Exit;
  end;
       q:=3;  res:='';

 // MsProjectApp.Application.Visible := true;

tx:=' Select texkompl_id, nomer,name,trudoem,cex,type_tex_type_tex_id  tt,nordsy.summ_nar_tx(texkompl_id,340) nar, NORDSY.GET_CHERTEZH(texkompl_id) doc ';
tx:=tx+' from ( ';
tx:=tx+' Select texkompl_id, decode(type_tex_type_tex_id,7,nomer,(Select nomer from tx_texkompl tt where tt.texkompl_id=tx.texkompl_texkompl_id)) as nomer1, ';
tx:=tx+'  nomer, type_tex_type_tex_id , name, trudoem,  (Select nomer from nordsy.dep where dep_id=tx.dep_dep_id) cex ';
tx:=tx+' from tx_texkompl tx ';
tx:=tx+' connect by prior texkompl_id =texkompl_texkompl_id ';
tx:=tx+' start with texkompl_id in ( ';
tx:=tx+' Select  texkompl_id ';
tx:=tx+' from tx_texkompl ';
tx:=tx+' where ';
tx:=tx+' project_project_id=340 '; //358
tx:=tx+' and type_tex_type_tex_id =7) ';
tx:=tx+' order by nomer1,type_tex_type_tex_id, nomer )';



 //  MsProjectApp.Application.Visible := true;
   OraQuery1.SQL.Text:=tx;
   OraQuery1.ExecSQL;
   OraQuery1.First;
    try
    MsProjectApp.Application.FileNew;

        MSProjectApp.Application.TableEditEx('Таблица Сведения',True,,,,, 'Text1' ,'Наименование',,,,,,,  3 ,,,,,);
          MSProjectApp.Application.TableEditEx('Таблица Сведения',True,,,,, 'Number1' ,'Трудоемкость плановая',,,,,,,  6 ,,,,,);
         MSProjectApp.Application.TableEditEx('Таблица Сведения',True,,,,, 'Text4' ,'ЦЕХ',,,,,,,  8 ,,,,,);
      MSProjectApp.Application.TableEditEx('Таблица Сведения',True,,,,, 'Number2' ,'Трудоемкость фактическая',,,,,,,  7 ,,,,,);
        MSProjectApp.Application.TableEditEx('Таблица Сведения',True,,,,, 'Text3' ,'Чертеж',,,,,,,  4 ,,,,,);

           MSProjectApp.Application.TableApply( 'Таблица Сведения');


//  MsProjectApp.Application.TableEdit(  Title:='Наименование', TaskTable:=True, NewName:='', NewFieldName:='Text1', Width:=40, ShowInMenu:=True, LockFirstColumn:=True, DateFormat:=255, RowHeight:=1, ColumnPosition:=2);
   // MsProjectApp.Application.TableEdit( Name:='&Entry', Title:='tx_id', TaskTable:=True, NewName:='', NewFieldName:='Text2', Width:=20, ShowInMenu:=True, LockFirstColumn:=True, DateFormat:=255, RowHeight:=1, ColumnPosition:=3);
  //    MSProjectApp.Application.TableApply('&Entry');
//      MsProjectApp.Application.Visible := true;
     While OraQuery1.Eof<>true  Do Begin
          Task := MsProjectApp.Application.ActiveProject.Tasks.Add(OraQuery1.FieldByName('nomer').AsString);

          task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Text1'), Copy(OraQuery1.FieldByName('name').AsString,1, 50));
          task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Text2'), OraQuery1.FieldByName('texkompl_id').AsString);
          task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Number1'), OraQuery1.FieldByName('trudoem').AsFloat);
               task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Number2'), OraQuery1.FieldByName('nar').AsFloat);
          task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Text4'), OraQuery1.FieldByName('cex').AsString);
          task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Text3'), Copy(OraQuery1.FieldByName('doc').AsString,1,253));
      //    Task.Start := strtodate('14.07.2014'); //потом поставить что нада и как нада!
        //  task.Font.Color:='pjBlack';

             ///Этапы ставлю
 k:=1;

                  if  OraQuery1.FieldByName('tt').AsString='7' then  res:='00';
       for i:=1 to StringGRid1.RowCount-1 do
              begin
                   name:=Task.name;
                   name:=copy(name,5,4);
                if (name= StringGRid1.Cells[0, i]) and (OraQuery1.FieldByName('tt').AsString='7') then
                if  length(StringGRid1.Cells[1, i])=1 then
                 res:='0'+StringGRid1.Cells[1, i]//if task.text5='' then task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Text5'),StringGRid1.Cells[1, i])
                 else   res:=StringGRid1.Cells[1, i]
              end;
                 Label1.Caption:=' Этап 3 проставляю Этапы -'+IntToStr(k)+' из ' +  IntTostr(MsProjectApp.Application.ActiveProject.Tasks.Count);


               task.text5:= res;

////Этапы поставил


       if (OraQuery1.FieldByName('tt').AsString='12') and (q=0) then
       begin
        MsProjectApp.Application.activeproject.Tasks(OraQuery1.recNo).Outlineindent;
        q:=1;
       end;
       if (OraQuery1.FieldByName('tt').AsString='7') then
        begin
        if (q<>3) and (q<>0) then MsProjectApp.Application.activeproject.Tasks(OraQuery1.recNo).Outlineoutdent;
             q:=0;
        end;
         label1.Caption:='Этап 1  '+IntToStr(OraQuery1.recNo)+' из ' +IntToStr(OraQuery1.RecordCount);
         OraQuery1.next;

       end;


tx:='Select tex_kompl,poz,decode(poz,''!!!'',null, decode(poz,null,null,(Select nomer from tx_texkompl where texkompl_id=poz))) nomer ';
tx:=tx+' from (';
tx:=tx+' Select tex_kompl,poz ';
tx:=tx+' from ( ';
tx:=tx+' Select tex_kompl,decode(poz,''!!!'',''!!!'',SUBSTR(kaka,poz+8,7))  poz, kaka ';
tx:=tx+'   from ( ';
tx:=tx+' Select tex_kompl,kaka,decode(poz,null,''!!!'',decode(poz,0,''!!!'',poz)) poz ';
tx:=tx+' from ( ';
tx:=tx+' Select tex_texkompl_id tex_kompl,  kaka,DECODE(SUBSTR(kaka,1,1),''0'',instr(kaka,decode(to_char(tex_texkompl_id),null,''!!!''||kaka,to_char(tex_texkompl_id)))) poz ';
tx:=tx+' from ( ';
tx:=tx+' Select tex_texkompl_id,nordsy.load_marsh_ALL( sp_sp_id  ,''ППУЕ'',''ПУЕ'',null) kaka ';
tx:=tx+'  from nordsy.tx_mat ';
tx:=tx+' where tex_texkompl_id in (Select texkompl_id from tx_texkompl where project_project_id=340 and type_tex_type_tex_id=12)) ';///300    326   358!!!
tx:=tx+' group by kaka, tex_texkompl_id ';
tx:=tx+' order by tex_kompl ';
tx:=tx+' ) ';
tx:=tx+' ) ';
tx:=tx+' ) ';
tx:=tx+'group by tex_kompl, poz)';
    OraQuery1.SQL.Text:=tx;
   OraQuery1.ExecSQL;
   OraQuery1.First;


   k:=1;
  label1.Caption:='Ставлю связи в акссес';



While   k<MsProjectApp.Application.ActiveProject.Tasks.Count do
   begin
     // DBGridEh1.DataSource.DataSet.Filtered:=false;
   //   ShowMessage('tex_kompl like  '+#39+MsProjectApp.Application.ActiveProject.Tasks(k).text2+#39);
         label1.Caption:=  'tex_kompl like  '+#39+MsProjectApp.Application.ActiveProject.Tasks(k).text2+#39;
      DBGridEh1.DataSource.DataSet.Filter:='tex_kompl like  '+#39+MsProjectApp.Application.ActiveProject.Tasks(k).text2+#39;

      DBGridEh1.DataSource.DataSet.Filtered:=true;
      DBGridEh1.DataSource.DataSet.First;
           While  DBGridEh1.DataSource.DataSet.EOf <> true do
              begin
                    if  (DBGridEh1.DataSource.DataSet.FieldByName('poz').AsString<>'!!!') and (DBGridEh1.DataSource.DataSet.FieldByName('poz').AsString<>'') then
                try
                 MsProjectApp.Application.ActiveProject.Tasks(DBGridEh1.DataSource.DataSet.FieldByName('nomer').AsString).TaskDependencies.Add(MsProjectApp.Application.ActiveProject.Tasks(k));
                except
            ShowMessage('Не найдена связь '+DBGridEh1.DataSource.DataSet.FieldByName('nomer').AsString);
                end;
            label1.Caption:='Этап 2  '+IntToStr(k)+' из ' +IntToStr(MsProjectApp.Application.ActiveProject.Tasks.Count);
           DBGridEh1.DataSource.DataSet.Next;

           end;

   k:=k+1;
   end;





   /// блок творческих связей
 if checkBox1.Checked=false then
   begin

  DBGridEh1.DataSource.DataSet.Filtered:=false;
tx:='Select texkompl_id, nomer, ';
tx:=tx+' SUBSTR(nomer,1,3) nom1, ';
tx:=tx+' SUBSTR(nomer,5,4) nom2, ';
tx:=tx+' SUBSTR(nomer,10) nom3, ';
//tx:=tx+' DECODE(TRANSLATE(SUBSTR(nomer,10),''_0123456789'',''_''),null,to_number(SUBSTR(nomer,10)),SUBSTR(nomer,10)) as nom3 , ';
tx:=tx+' (Select nomer from nordsy.dep where dep_id=t.dep_dep_id) cex ';
tx:=tx+' from tx_texkompl t ';
tx:=tx+' where type_tex_type_tex_id=12 ';
tx:=tx+' and project_project_id=340 ';     //358
tx:=tx+' order by  nom2,nom1,nom3 ';
    OraQuery1.SQL.Text:=tx;
   OraQuery1.ExecSQL;
   OraQuery1.First;
       tx:= OraQuery1.FieldByName('nom2').AsString;
       tx1:=OraQuery1.FieldByName('nomer').AsString;
       OraQuery1.Next;
  While OraQuery1.Eof<>true  Do
     Begin
        if OraQuery1.FieldByName('nom2').AsString=tx then
         try
        MsProjectApp.Application.ActiveProject.Tasks(OraQuery1.FieldByName('nomer').AsString).TaskDependencies.Add(MsProjectApp.Application.ActiveProject.Tasks(tx1))
                         except
            ShowMessage('Не найдена связь'+OraQuery1.FieldByName('nomer').AsString);
                end
        else
         tx:=OraQuery1.FieldByName('nom2').AsString;
        tx1:=OraQuery1.FieldByName('nomer').AsString;
       label1.Caption:='Этап 3  '+IntTostr(OraQuery1.RecNo) +' из ' +IntToStr(OraQuery1.RecordCount);

      OraQuery1.Next;

     end;
    end; //of checker



//// раставляю под этапы по табличке
k:=1;     test:=0;
While   k<MsProjectApp.Application.ActiveProject.Tasks.Count do
   begin

 r:= MsProjectApp.Application.ActiveProject.Tasks(k).TaskDependencies;
   k1:=1;

        res_max:=9999;
    while k1<= r.count  do
       begin
           if r.Item[k1].from.Name=MsProjectApp.Application.ActiveProject.Tasks(k).name then
               Begin
//               k2:=r.OutlineParent.OutlineChildren;
 //              while k3<=k2.count do
                    name:=r.Item[k1].to.text5;
                 if (res_max>StrToInt(Copy(name,1,2))) and (check_svayz_vn(k,r.Item[k1].to.id,MsProjectApp)=0) then
                  begin
                 res_max:=StrToInt(Copy(name,1,2));
                     test:=test+1;
                   end;

           end;
   k1:=k1+1;



  end;
  if test>=1 then
    begin
      MsProjectApp.Application.ActiveProject.Tasks(k).text5:=MsProjectApp.Application.ActiveProject.Tasks(k).text5+'-0'+IntToStr(res_max);
     test:=0;
    end;
   k:=k+1;
end;

/// проставляю подэтапы на тК
k:=1;
e:=1;
q1:=1;
   delta:=1000; delta1:=9999;

        if CheckBox2.Enabled=true then
        begin
          While   k<=MsProjectApp.Application.ActiveProject.Tasks.Count do
            begin
            r:= MsProjectApp.Application.ActiveProject.Tasks(k);
            if   r.OutlineLevel=1 then
               if r.Summary=true then
               begin
                Etap_of_real:=r.name;
                ts:=r.OutlineChildren ;
                while  e<=ts.Count do
                   begin
              if Length(ts.item[e].text5)=5 then
                     begin
                     if (Delta>StrToInt(Copy(ts.item[e].text5,4,2))) and (StrToInt(Copy(ts.item[e].text5,4,2))<>0) then
                        begin
                      //     ShowMessage(MsProjectApp.Application.ActiveProject.Tasks(k).name+'!!!!!!!!!!!!' +ts.item[e].Name);
                          if   check_vn(MsProjectApp.Application.ActiveProject.Tasks(k).name,ts.item[e].Name, MsProjectApp)=1
                           then begin Delta:=StrToInt(Copy(ts.item[e].text5,4,2));
                     //             ShowMessage(MsProjectApp.Application.ActiveProject.Tasks(k).name+'  00000  '+ ts.item[e].Name+' '+Copy(ts.item[e].text5,4,2));
                                end;
                        end;

                     end;
                       e:=e+1;
                  end;

               end;


                  if Delta<>1000 then
                     begin
                       if Length(IntToStr(delta))<2 then k1_t:='0' else  k1_t:='';
                       MsProjectApp.Application.ActiveProject.Tasks(k).text5:=MsProjectApp.Application.ActiveProject.Tasks(k).text5+'-'+k1_t+IntToStr(delta);
                //       ShowMessage('GGGG '+MsProjectApp.Application.ActiveProject.Tasks(k).name);
                     end;

                Delta:=1000;e:=1;    label1.Caption:='Этап 3.1  '+IntTostr(MsProjectApp.Application.ActiveProject.Tasks.Count) +' из ' +IntToStr(k);
              k:=k+1;
          end;
        end;

   finally
           MSProjectApp.Sort('Text5', EmptyParam, EmptyParam,EmptyParam, EmptyParam, EmptyParam, true, true);
  MsProjectApp.Application.Visible := true;
//  MsProjectApp.Application.Quit(false);

end;

end;

procedure TForm34.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if   OraQuery1.Filtered=true then OraQuery1.Filtered:=false;
    OraQuery1.Close;
end;

procedure TForm34.Button3Click(Sender: TObject);
var
  L : TStringList;
  I : Integer;
begin
  L := TStringList.Create;
  L.LoadFromFile('c:\fish.txt');
 StringGrid1.RowCount := L.Count+1;
 StringGrid1.ColCount := 2;
  For I := 0 To L.Count-1 Do
    Begin
       StringGrid1.Cells[0,i + 1] := Copy(L[i],1,Pos(';',L[i])-1);
       StringGrid1.Cells[1,i + 1] := Copy(L[i],Pos(';',L[i])+1,Length(L[i]));
    End;
  L.Free;
end;

procedure TForm34.Button4Click(Sender: TObject);
begin
  if OpenDialog1.InitialDir = '' then begin
    OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);
  end;
  openDialog1.Options := [ofFileMustExist];
  openDialog1.Filter :='Project |*.mpp|All Files|*.*';

    if  OpenDialog1.Execute  then
    begin
       OpenDialog1.InitialDir:=ExtractFilePath(OpenDialog1.fileName) ;
      Edit1.text:=OpenDialog1.fileName;
    end
    else exit;

end;

procedure StrBreakApart(const S, Delimeter: string; Parts: TStrings);
var
  CurPos: integer;
  CurStr: string;
begin
  Parts.clear;
  Parts.BeginUpdate();
  try
    CurStr := S;
    repeat
      CurPos := Pos(Delimeter, CurStr);
      if (CurPos > 0) then
      begin
        Parts.Add(Copy(CurStr, 1, Pred(CurPos)));
        CurStr := Copy(CurStr, CurPos + Length(Delimeter),
          Length(CurStr) - CurPos - Length(Delimeter) + 1);
      end
      else
        Parts.Add(CurStr);
    until CurPos = 0;
  finally
    Parts.EndUpdate();
  end;
end;

procedure TForm34.Button5Click(Sender: TObject);
begin
  form9.Caption:='Выберите проект для анализа';
  form9.ShowModal();
end;

procedure TForm34.Button6Click(Sender: TObject);
var
  MsProjectApp : Variant;
  Task,r,ts,object1,object2: Variant;
  k,t,enda,stopper:integer;
  tx,messa:string;
  Tmp: TStrings;
  pobeda,  objectt,objectt1:boolean;
  log_out,Hard_link:textfile;
  test,k1,res_max,e,q1,delta,delta1:integer;
   Etap_of_real,k1_t,name,Hard_link_text:string;
begin
AssignFile(log_out,'c:\logi.txt');
    Rewrite(log_Out);
   Tmp := TStringList.Create();
if  Edit1.text='' then
  begin
    ShowMessage('Не выбран файл плана!!!');
    exit;
  end;

 if  Edit2.text='' then
  begin
    ShowMessage('Не выбран проект!!!');
    exit;
  end;

  try
    MsProjectApp := CreateOleObject('MSProject.Application');
       MsProjectApp.Application.FileOpenEx(openDialog1.filename);
  except
    ShowMessage('Не удалось открыть MS Project');
    Exit;
  end;

    if CheckBox3.Checked=true then       MsProjectApp.Application.visible:=true;
           MsProjectApp.Application.OutlineShowTasks(2);
           MsProjectApp.Application.ActiveCell.Task.OutlineShowSubTasks;


            MSProjectApp.Application.FilterApply('&Все задачи');
     MSProjectApp.Application.OutlineHideSubTasks;
      MSProjectApp.Application.OutlineShowAllTasks;
    k:=2;
    While   k<=MsProjectApp.Application.ActiveProject.Tasks.Count-1 do
            begin
            r:= MsProjectApp.Application.ActiveProject.Tasks(k);
            MsProjectApp.Application.SelectTaskField(Row:=r.id, Column:='Date8', RowRelative:=False);
            MsProjectApp.Application.Font32Ex(EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam, -16777216,EmptyParam, EmptyParam);
            k:=k+1;
      end;

     Label1.Caption:=' Вытягиваю ТК и УКР из Tronix.....';
tx:=' Select TK,UK,tex_id, ';
tx:=tx+'  to_number(nar) nar, trud, ';
tx:=tx+' (Select name from tx_texkompl where texkompl_id=tex_id) name,';
tx:=tx+' (Select nomer from nordsy.dep where dep_id=dep_tk) cex, ';
tx:=tx+' (Select PDATE_BEG from tx_texkompl where texkompl_id=tex_id) PDATE_BEG, ';
tx:=tx+' (Select PDATE_END from tx_texkompl where texkompl_id=tex_id) PDATE_END ';
tx:=tx+' from ';
tx:=tx+' ( ';
tx:=tx+' SELECT LTRIM(SUBSTR(PATH,2,INSTR(PATH,''|'',1,2)-2)) TK, ';
tx:=tx+' NORDSY.SUM_TRUD_PROF_TEXKOMPL((Select texkompl_id from tx_texkompl where nomer=SUBSTR(PATH,2,INSTR(PATH,''|'',1,2)-2) and project_project_id=346),0) nar , ';
tx:=tx+' NORDSY.SUM_TRUD((Select texkompl_id from tx_texkompl where nomer=SUBSTR(PATH,2,INSTR(PATH,''|'',1,2)-2) and project_project_id=346)) trud, ';
tx:=tx+' (Select texkompl_id from tx_texkompl where nomer=SUBSTR(PATH,2,INSTR(PATH,''|'',1,2)-2) and project_project_id=346) tex_id,';
tx:=tx+' (Select dep_dep_id from  tx_texkompl where nomer=SUBSTR(PATH,2,INSTR(PATH,''|'',1,2)-2) and project_project_id=346) dep_tk, ';
tx:=tx+' path UK ';
tx:=tx+'  FROM ';
tx:=tx+' ( ';
tx:=tx+' Select PATH from ( ';
tx:=tx+' SELECT SYS_CONNECT_BY_PATH(nomer, ''|'') AS PATH,  texkompl_texkompl_id ';
tx:=tx+' FROM tx_texkompl ';
tx:=tx+' START WITH texkompl_id in ';
tx:=tx+' (Select texkompl_id ';
tx:=tx+'  from ';
tx:=tx+' ( ';
tx:=tx+' SELECT  texkompl_id, type_tex_type_tex_id ';
tx:=tx+' FROM tx_texkompl ';
tx:=tx+' CONNECT BY PRIOR texkompl_id = texkompl_texkompl_id ';
tx:=tx+' START WITH texkompl_ID = ';
tx:=tx+' (Select texkompl_id ';
tx:=tx+' from tx_texkompl ';
tx:=tx+' where ';
tx:=tx+'  texkompl_texkompl_id is null ';
tx:=tx+' and nvl_texkompl_texkompl_id=0 ';
tx:=tx+' and nsort=1 ';
tx:=tx+' and type_tex_type_tex_id=11 and project_project_id=346) ';
tx:=tx+' ) ';
tx:=tx+' where type_tex_type_tex_id=7 ';
tx:=tx+' ) ';
tx:=tx+' CONNECT BY prior texkompl_texkompl_id = texkompl_ID ) ';
tx:=tx+' where texkompl_texkompl_id is null ';
tx:=tx+' )';
tx:=tx+'  )';
   OraQuery1.SQL.Text:=tx;

   OraQuery1.ExecSQL;
    OraQuery1.First;   k:=0; messa:=' Start ';
    While OraQuery1.Eof<>true  Do
      Begin

      MsProjectApp.Application.SelectTaskField( 0,'Название',EmptyParam,EmptyParam,EmptyParam,EmptyParam,);
        objectt:=MsProjectApp.Application.FindEx('Название','равно',OraQuery1.FieldByName('TK').AsString, True,EmptyParam,EmptyParam,EmptyParam,true);
         if  objectt=true
           then
              begin
          //    ShowMessage((STRING(MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date8))+'  '+IntToSTR(MsProjectApp.Application.ActiveCell.task.id));
              writeln(log_Out,'ТК '+OraQuery1.FieldByName('TK').AsString+' уже есть !Буду проверять сопутку');
              if (STRING(MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date8)='НД') and
               (OraQuery1.FieldByName('PDATE_BEG').AsString<>'')
                  then
                    begin
                       writeln(log_Out,'ТК '+OraQuery1.FieldByName('TK').AsString+' изменилась дата НАЧАЛА была НД  стала '+OraQuery1.FieldByName('PDATE_BEG').AsString);
                       MsProjectApp.Application.SelectTaskField(Row:=MsProjectApp.Application.ActiveCell.task.id, Column:='Date8', RowRelative:=False);
                       MsProjectApp.Application.Font32Ex(EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam, '&HFFFF99',EmptyParam, EmptyParam);
                           MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).Date8:=OraQuery1.FieldByName('PDATE_BEG').AsString;
                     end
                     else
                           if (STRING(MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date8)='НД') and
                              (OraQuery1.FieldByName('PDATE_BEG').AsString='')
                                 then
                               else
                     if DateToStr(MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date8)<> (OraQuery1.FieldByName('PDATE_BEG').AsString)
                        then
                                   begin
                   writeln(log_Out,'ТК '+OraQuery1.FieldByName('TK').AsString+' изменилась дата НАЧАЛА была '+DateToStr(MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date8)+
                  ' стала '+OraQuery1.FieldByName('PDATE_BEG').AsString);
                       MsProjectApp.Application.SelectTaskField(Row:=MsProjectApp.Application.ActiveCell.task.id, Column:='Date8', RowRelative:=False);
                       MsProjectApp.Application.Font32Ex(EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam, '&HFFFF99',EmptyParam, EmptyParam);
                           MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).Date8:=OraQuery1.FieldByName('PDATE_BEG').AsString;

                           end;

                                   ////////////////////////////////////////*****Дату начало откатал
               if (STRING(MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date9)='НД') and
               (OraQuery1.FieldByName('PDATE_END').AsString<>'')
                 then
                  begin
                     writeln(log_Out,'ТК '+OraQuery1.FieldByName('TK').AsString+' изменилась дата КОНЦА была НД  стала '+OraQuery1.FieldByName('PDATE_END').AsString);
                     MsProjectApp.Application.SelectTaskField(Row:=MsProjectApp.Application.ActiveCell.task.id, Column:='Date9', RowRelative:=False);
                     MsProjectApp.Application.Font32Ex(EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam, '&HFFFF99',EmptyParam, EmptyParam);
                           MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).Date8:=OraQuery1.FieldByName('PDATE_END').AsString;
                     end
                     else
                          if (STRING(MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date9)='НД') and
                              (OraQuery1.FieldByName('PDATE_END').AsString='')
                                 then
                               else
                     if DateToStr(MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date9)<> (OraQuery1.FieldByName('PDATE_END').AsString)
                        then
                                   begin
                   writeln(log_Out,'ТК '+OraQuery1.FieldByName('TK').AsString+' изменилась дата КОНЦА была '+DateToStr(MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date9)+
                  ' стала '+OraQuery1.FieldByName('PDATE_END').AsString);
                       MsProjectApp.Application.SelectTaskField(Row:=MsProjectApp.Application.ActiveCell.task.id, Column:='Date9', RowRelative:=False);
                      MsProjectApp.Application.Font32Ex(EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam, '&HFFFF99',EmptyParam, EmptyParam);
                           MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).Date9:=OraQuery1.FieldByName('PDATE_END').AsString;

                                   end;


        //    ShowMessage(MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date8);

          //    if OraQuery1.FieldByName('PDATE_BEG').AsString=''
         //             then
          //               begin
         //               writeln(log_Out,'ТК '+OraQuery1.FieldByName('TK').AsString+' НЕТ даты НАЧАЛА  в ТРОНИКС');
        //                 end
        //          else
        //       if MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date8<>OraQuery1.FieldByName('PDATE_BEG').AsString
        //       then
        //           begin
        //             if MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date8<>'НД' then
        //           writeln(log_Out,'ТК '+OraQuery1.FieldByName('TK').AsString+' изменилась дата НАЧАЛА была '+DateToStr(MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date8)+
        //          ' стала '+OraQuery1.FieldByName('PDATE_BEG').AsString);
        //             MsProjectApp.Application.SelectTaskField(Row:=8, Column:='Date8', RowRelative:=False);
        //       MsProjectApp.Application.Font32Ex(EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam, '&HFFFF99',EmptyParam, EmptyParam);
        //           end;
        //
        //        if OraQuery1.FieldByName('PDATE_END').AsString=''
        //              then
        //                 begin
        //                writeln(log_Out,'ТК '+OraQuery1.FieldByName('TK').AsString+' НЕТ даты КОНЦА в ТРОНИКС !!');
          //
          //               end
          //        else

//               if (MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date9)<>(OraQuery1.FieldByName('PDATE_END').AsString)
//               then
 //                  begin
 //                  if MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date9<>'НД' then
 //                  writeln(log_Out,'ТК '+OraQuery1.FieldByName('TK').AsString+' изменилась дата КОНЦА была '+DateToStr(MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).date9)+
 //                  ' стала '+OraQuery1.FieldByName('PDATE_END').AsString);
 //

  //                end;


 //               if MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).Number1<>(OraQuery1.FieldByName('trud').Asfloat)
 //              then
 //                  begin
 //                  writeln(log_Out,'ТК '+OraQuery1.FieldByName('TK').AsString+' изменилась трудоемкость была '+IntToStr(MsProjectApp.Application.ActiveProject.tasks(MsProjectApp.Application.ActiveCell.task.id).number1)+
 //                  ' стала '+OraQuery1.FieldByName('trud').AsString);
 //                 end;
//
 //
 //********************************************************************************************
            end
           else
             begin
                  StrBreakApart(OraQuery1.FieldByName('UK').AsString,'|', Tmp); t:=2;
            While TMP.Count>=t  Do    //  ShowMessage(TMP[2]+'  2 '+TMP[3]+'  3'+IntTostr(TMP.Count));
                   begin ///**** TMP
                         MsProjectApp.Application.SelectTaskField( 0,'Название',EmptyParam,EmptyParam,EmptyParam,EmptyParam,);
                   objectt1:=MsProjectApp.Application.FindEx('УКР2','равно',TMP[t], True,EmptyParam,EmptyParam,EmptyParam,false);
           //         Sleep(300);
                      if  objectt1=false then
                        writeln(log_Out,'для ТК '+OraQuery1.FieldByName('TK').AsString+' нету УКР'+OraQuery1.FieldByName('UK').AsString+' по '+TMP[t])
                        else begin //**
                      r:= MsProjectApp.Application.ActiveProject.Tasks(MsProjectApp.Application.ActiveCell.task.id);
                        ts:=r.OutlineChildren ;
                    if  ts.Count=0 then
                    k:=1
                   else k:=0;

                    Label1.Caption:=' Вставляю ТК MS '+IntTostr(OraQuery1.RecNo)+' из ' +IntTostr(OraQuery1.RecordCount);
                  Task := MsProjectApp.Application.ActiveProject.Tasks.ADD(OraQuery1.FieldByName('TK').AsString,  r.id+1);  ///* MsProjectApp.Application.ActiveCell.task.id+1
                  //ShowMessage(OraQuery1.FieldByName('TK').AsString);
                   task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Text13'), Copy(OraQuery1.FieldByName('name').AsString,1, 50));
                  task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Text14'), Copy(OraQuery1.FieldByName('cex').AsString,1, 50));
                    task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('date1'), now());
                    task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Number1'), OraQuery1.FieldByName('trud').AsFloat);
                    task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Number2'), OraQuery1.FieldByName('nar').AsFloat);
                    Task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('text12'),MsProjectApp.Application.ActiveCell.task.text12);
                     Task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('date8'),OraQuery1.FieldByName('PDATE_BEG').AsString);
                      Task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('date9'),OraQuery1.FieldByName('PDATE_END').AsString);
            if k=1 then   begin
             MsProjectApp.Application.activeproject.Tasks(MsProjectApp.Application.ActiveCell.task.id+1).Outlineindent;
           // MsProjectApp.Application.activeproject.Tasks(MsProjectApp.Application.ActiveCell.task.id).Outlineoutdent;
                         end;
                       t:=2; break;
                     end; //***
                        t:=t+1;
                     end; //TMP
                  end;
         OraQuery1.Next;
        end;
  //       MsProjectApp.Application.visible:=true;
  //   exit;
  ///******************************поддаскиваю ПТК (бригадокомплекты))))
      Label1.Caption:=' Вытягиваю ПТК  из Tronix.....';
tx:='   Select texkompl_id t_id, ';
tx:=tx+' nar, ';
tx:=tx+' (Select nomer from nordsy.dep where dep_id=dep_tk) cex, ';
tx:=tx+' nomer, ';
tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=tt_id) nomer_up, ';
tx:=tx+' name, trud,PDATE_BEG,PDATE_END ';
tx:=tx+' from ';
tx:=tx+' ( ';
tx:=tx+' Select Texkompl_id, texkompl_texkompl_id tt_id, ';
tx:=tx+' trudoem trud, nordsy.summ_nar_tx(texkompl_id,346) nar, ';
tx:=tx+' dep_dep_id dep_tk, ';
tx:=tx+' nomer, name ,PDATE_BEG,PDATE_END';
tx:=tx+' from tx_texkompl ';
tx:=tx+' where ';
tx:=tx+' type_tex_type_tex_id=12 ';
tx:=tx+' and project_project_id=346 ';
tx:=tx+' ) ';

   OraQuery1.SQL.Text:=tx;

   OraQuery1.ExecSQL;
    OraQuery1.First;   k:=0; //messa:=' Start ПТК';
    While OraQuery1.Eof<>true  Do
         begin
               MsProjectApp.Application.SelectTaskField( 0,'Название',EmptyParam,EmptyParam,EmptyParam,EmptyParam,);
            objectt:=MsProjectApp.Application.FindEx('Название','=',OraQuery1.FieldByName('nomer').AsString, True,EmptyParam,EmptyParam,EmptyParam,true);
//            Sleep(100);
                if  objectt=true
           then
              begin
//              messa:=messa+'ПТК '+OraQuery1.FieldByName('nomer').AsString+' уже есть !'
               writeln(log_Out,'ПТК '+OraQuery1.FieldByName('nomer').AsString+' уже есть !');
              end
           else
             begin
                 MsProjectApp.Application.SelectTaskField( 0,'Название',EmptyParam,EmptyParam,EmptyParam,EmptyParam,);
              objectt1:=MsProjectApp.Application.FindEx('Название','равно',trim(OraQuery1.FieldByName('nomer_up').AsString), True,EmptyParam,EmptyParam,EmptyParam,true);

             if  objectt1=false then
               //messa:=messa+'для ПТК '+OraQuery1.FieldByName('nomer').AsString+' нету ТК'+OraQuery1.FieldByName('nomer_up').AsString+chr(13)
              writeln(log_Out,'для ПТК '+OraQuery1.FieldByName('nomer').AsString+' нету ТК !'+OraQuery1.FieldByName('nomer_up').AsString+'!')
             else begin //**
               r:= MsProjectApp.Application.ActiveProject.Tasks(MsProjectApp.Application.ActiveCell.task.id);
               ts:=r.OutlineChildren ;
               if  ts.Count=0 then
                k:=1
              else k:=0;
               Label1.Caption:=' Вставляю ПТК MS '+IntTostr(OraQuery1.RecNo)+' из ' +IntTostr(OraQuery1.RecordCount);
           Task := MsProjectApp.Application.ActiveProject.Tasks.ADD(OraQuery1.FieldByName('Nomer').AsString, MsProjectApp.Application.ActiveCell.task.id+1);
         //  task.Start:=nil;
         //  task.finish:=nil;
      //     task

            writeln(log_Out,'НОВОЕ ПТК '+OraQuery1.FieldByName('nomer').AsString);
         task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Text13'), Copy(OraQuery1.FieldByName('name').AsString,1, 50));
          task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Text14'), Copy(OraQuery1.FieldByName('cex').AsString,1, 50));
         task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('date1'), now());
         task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Number1'), OraQuery1.FieldByName('trud').AsFloat);
         task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('Number2'), OraQuery1.FieldByName('nar').AsFloat);
         Task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('date8'),OraQuery1.FieldByName('PDATE_BEG').AsString);
         Task.SetField(MsProjectApp.Application.FieldNameToFieldConstant('date9'),OraQuery1.FieldByName('PDATE_END').AsString);

   if k=1 then   begin
    MsProjectApp.Application.activeproject.Tasks(MsProjectApp.Application.ActiveCell.task.id+1).Outlineindent;
                end;
            end;

          end;


         OraQuery1.Next;
         end;


  ///********************************поддаскиваю ПТК (бригадокомплекты))))

  ////************сортировка
    if stopper=1 then
       begin
    MSProjectApp.Application.FilterApply('&Все задачи');
       MsProjectApp.Application.SelectAll;
  MSProjectApp.Application.OutlineShowTasks('1', True);
  k:=2;
    While   k<=MsProjectApp.Application.ActiveProject.Tasks.Count-1 do
            begin

            r:= MsProjectApp.Application.ActiveProject.Tasks(k);
    Label1.Caption:=' Проставляю этапы '+IntTostr(k)+' из ' +IntTostr(MsProjectApp.Application.ActiveProject.Tasks.Count-1);
        if r.TExt10='' then
              r.SetField(MsProjectApp.Application.FieldNameToFieldConstant('text10'),MsProjectApp.Application.ActiveProject.tasks(k-1).text10);
        if r.TExt11='' then
               r.SetField(MsProjectApp.Application.FieldNameToFieldConstant('text11'),MsProjectApp.Application.ActiveProject.tasks(k-1).text11);
        k:=k+1;
    end;
   end; //stopper
  //  Сортировка
  //  MSProjectApp.Application.Sort('Текст11',EmptyParam,'Название',EmptyParam, EmptyParam,EmptyParam,True);

 //**************************** пошел ставить связи по ПТК

 tx:='Select tex_kompl,(Select nomer from tx_texkompl where texkompl_id=tex_kompl) nomer1,';
tx:=tx+'  poz,decode(poz,''!!!'',null, decode(poz,null,null,(Select nomer from tx_texkompl where texkompl_id=poz))) nomer ';
tx:=tx+' from (';
tx:=tx+' Select tex_kompl,poz ';
tx:=tx+' from ( ';
tx:=tx+' Select tex_kompl,decode(poz,''!!!'',''!!!'',SUBSTR(kaka,poz+8,7))  poz, kaka ';
tx:=tx+'   from ( ';
tx:=tx+' Select tex_kompl,kaka,decode(poz,null,''!!!'',decode(poz,0,''!!!'',poz)) poz ';
tx:=tx+' from ( ';
tx:=tx+' Select tex_texkompl_id tex_kompl,  kaka,DECODE(SUBSTR(kaka,1,1),''0'',instr(kaka,decode(to_char(tex_texkompl_id),null,''!!!''||kaka,to_char(tex_texkompl_id)))) poz ';
tx:=tx+' from ( ';
tx:=tx+' Select tex_texkompl_id,nordsy.load_marsh_ALL( sp_sp_id  ,''ППУЕ'',''ПУЕ'',null) kaka ';
tx:=tx+'  from nordsy.tx_mat ';
tx:=tx+' where tex_texkompl_id in (Select texkompl_id from tx_texkompl where project_project_id=346 and type_tex_type_tex_id=12)) ';///300    326   358!!!
tx:=tx+' group by kaka, tex_texkompl_id ';
tx:=tx+' order by tex_kompl ';
tx:=tx+' ) ';
tx:=tx+' ) ';
tx:=tx+' ) ';
tx:=tx+'group by tex_kompl, poz)';
  label1.Caption:='Ставлю связи по ПТК.....запрос';
    OraQuery1.SQL.Text:=tx;
   OraQuery1.ExecSQL;
   OraQuery1.First;
   k:=1;
  label1.Caption:='Ставлю связи по ПТК.....';
While   k<MsProjectApp.Application.ActiveProject.Tasks.Count do
   begin
         label1.Caption:=  'tex_kompl like  '+#39+MsProjectApp.Application.ActiveProject.Tasks(k).text2+#39;
      DBGridEh1.DataSource.DataSet.Filter:='nomer like  '+#39+MsProjectApp.Application.ActiveProject.Tasks(k).Name;//.text2+#39;

      DBGridEh1.DataSource.DataSet.Filtered:=true;
      DBGridEh1.DataSource.DataSet.First;
           While  DBGridEh1.DataSource.DataSet.EOf <> true do
              begin
                    if  (DBGridEh1.DataSource.DataSet.FieldByName('poz').AsString<>'!!!') and (DBGridEh1.DataSource.DataSet.FieldByName('poz').AsString<>'') then
                try
                begin
                  MsProjectApp.Application.ActiveProject.Tasks(DBGridEh1.DataSource.DataSet.FieldByName('nomer').AsString).TaskDependencies.Add(MsProjectApp.Application.ActiveProject.Tasks(DBGridEh1.DataSource.DataSet.FieldByName('nomer1').AsString));
                             writeln(log_Out,'Новая связь '+DBGridEh1.DataSource.DataSet.FieldByName('nomer').AsString+' к '+DBGridEh1.DataSource.DataSet.FieldByName('nomer1').AsString);
                end;
                except
                  ShowMessage('Не найдена связь '+DBGridEh1.DataSource.DataSet.FieldByName('nomer1').AsString+' добавляю'+MsProjectApp.Application.ActiveProject.Tasks(k).name);
                end;
            label1.Caption:='Этап 2  '+IntToStr(k)+' из ' +IntToStr(MsProjectApp.Application.ActiveProject.Tasks.Count);
           DBGridEh1.DataSource.DataSet.Next;

           end;

   k:=k+1;
   end;

   //Связи по птк
   ///****Подставляю этапы на ПТК начало только
          //***ВОт тут
    //   MSProjectApp.Application.FilterApply('&Все задачи');
  //     MsProjectApp.Application.SelectAll;
  if stopper>1 then
     begin

  MSProjectApp.Application.OutlineShowTasks('4', True);
k:=2;
 While   k<=MsProjectApp.Application.ActiveProject.Tasks.Count-1 do
           begin

           r:= MsProjectApp.Application.ActiveProject.Tasks(k);
            ts:=r.OutlineParent;
    Label1.Caption:=' Проставляю подэтапы '+IntTostr(k)+' из ' +IntTostr(MsProjectApp.Application.ActiveProject.Tasks.Count-1);
        if (r.TExt12='') and (ts.text12<>'') then
              r.SetField(MsProjectApp.Application.FieldNameToFieldConstant('text12'),ts.text12);
       k:=k+1;
   end;
///****Подставляю этапы на ПТК начало только

 ////  Подставляю второй код

 k:=1;     test:=0;
While   k<MsProjectApp.Application.ActiveProject.Tasks.Count do
   begin

 r:= MsProjectApp.Application.ActiveProject.Tasks(k).TaskDependencies;
   k1:=1;

        res_max:=9999;
    while k1<= r.count  do
       begin
           if r.Item[k1].from.Name=MsProjectApp.Application.ActiveProject.Tasks(k).name then
               Begin
//               k2:=r.OutlineParent.OutlineChildren;
 //              while k3<=k2.count do
                    name:=r.Item[k1].to.text12;  //ShowMessage( name);
                 if  (name<>'') and (Length(name)<3) then
                 if (res_max>StrToInt(Copy(name,1,2))) and (check_svayz_vn(k,r.Item[k1].to.id,MsProjectApp)=0) then
                  begin
                 res_max:=StrToInt(Copy(name,1,2));
                     test:=test+1;
                   end;

           end;
   k1:=k1+1;



  end;
  if test>=1 then
    begin
      MsProjectApp.Application.ActiveProject.Tasks(k).text12:=MsProjectApp.Application.ActiveProject.Tasks(k).text12+'-0'+IntToStr(res_max);
     test:=0;
    end;
   k:=k+1;
end;


  k:=1;
e:=1;
q1:=1;
   delta:=1000; delta1:=9999;


          While   k<=MsProjectApp.Application.ActiveProject.Tasks.Count do
           begin
            r:= MsProjectApp.Application.ActiveProject.Tasks(k);
            if   r.OutlineLevel=3 then
               if r.Summary=true then
               begin
                Etap_of_real:=r.name;
                ts:=r.OutlineChildren ;
                while  e<=ts.Count do
                   begin
              if Length(ts.item[e].text12)=5 then
                     begin
                     if (Delta>StrToInt(Copy(ts.item[e].text12,4,2))) and (StrToInt(Copy(ts.item[e].text12,4,2))<>0) then
                        begin
                          if   check_vn(MsProjectApp.Application.ActiveProject.Tasks(k).name,ts.item[e].Name, MsProjectApp)=1
                           then begin Delta:=StrToInt(Copy(ts.item[e].text12,4,2));
                                end;
                        end;
                     end;
                       e:=e+1;
                  end;
               end;
                  if Delta<>1000 then
                     begin
                      if Length(IntToStr(delta))<2 then k1_t:='0' else  k1_t:='';
                       MsProjectApp.Application.ActiveProject.Tasks(k).text12:=MsProjectApp.Application.ActiveProject.Tasks(k).text12+'-'+k1_t+IntToStr(delta);
                     end;

                Delta:=1000;e:=1;    label1.Caption:='Этап 3.1  '+IntTostr(MsProjectApp.Application.ActiveProject.Tasks.Count) +' из ' +IntToStr(k);
              k:=k+1;
          end;



  ////  *****Подставляю второй код

 ////  *****Подставляю жесткие связи из текстовой таблички
  AssignFile(Hard_link,'c:\Hard_link.txt');
        MSProjectApp.Application.OutlineShowAllTasks;
   MSProjectApp.Application.FilterApply('&Все задачи');
 k:=1;

  While   k<=MsProjectApp.Application.ActiveProject.Tasks.Count do
  begin
     r:= MsProjectApp.Application.ActiveProject.Tasks(k);
       if   r.OutlineLevel=3 then
        begin
   Reset(Hard_link);
                   while not Eof(Hard_link) do
                        begin
                           ReadLn(Hard_link,Hard_link_text);
                                if Copy(Hard_link_text,1,1)<>';' then
                                      begin
                                         if  Pos(Copy(Hard_link_text,1,4),r.name)<>0 then
                                             begin
                                              writeln(log_Out,Copy(Hard_link_text,1,4)+' !!! '+r.name+' УКР '+r.OutlineParent.Text11+' буду искать '+Copy(r.name,1,3)+'-'+Copy(Hard_link_text,6,4)+'-'+Copy(r.name,10,3)+' qqqq ');
                                           MsProjectApp.Application.SelectTaskField( 0,'Название',EmptyParam,EmptyParam,EmptyParam,EmptyParam,);enda:=1;
                                            object1:=MsProjectApp.Application.FindEx('Название','содержит',Copy(r.name,1,3)+'-'+Copy(Hard_link_text,6,4)+'-'+Copy(r.name,10,3), True,EmptyParam,EmptyParam,EmptyParam,true);
                                           if object1=true then
                                begin   //******!!!!
                                       //         writeln(log_Out,Copy(Hard_link_text,1,4)+' !!! '+MsProjectApp.Application.ActiveCell.task.name+' уровень '+MsProjectApp.Application.ActiveCell.Task.OutlineParent.Text11);
                                               if MsProjectApp.Application.ActiveCell.Task.OutlineParent.Text11=r.OutlineParent.Text11
                                                    then begin
                                                          try
                                                          MsProjectApp.Application.ActiveCell.task.TaskDependencies.Add(r);
                                                          finally
                                                           writeln(log_Out,Copy(Hard_link_text,1,4)+' !!! '+MsProjectApp.Application.ActiveCell.task.name+' уровень '+MsProjectApp.Application.ActiveCell.Task.OutlineParent.Text11+' БЕРУ!!!');
                                                          end;
                                                       //   r.TaskDependencies.Add(MsProjectApp.Application.ActiveCell.task);
//  MsProjectApp.Application.ActiveProject.Tasks(DBGridEh1.DataSource.DataSet.FieldByName('nomer').AsString).TaskDependencies.Add(MsProjectApp.Application.ActiveProject.Tasks(DBGridEh1.DataSource.DataSet.FieldByName('nomer1').AsString));
                                                          enda:=0;
                                                    end;
                                           while enda=1 do
                                             begin   //**
                                           object1:=MsProjectApp.Application.FindNEXT;
                                           if object1=true then
                                             begin
                                         //       Showmessage(MsProjectApp.Application.ActiveCell.task.name);
                                         //        writeln(log_Out,Copy(Hard_link_text,1,4)+' !!! '+MsProjectApp.Application.ActiveCell.task.name+' уровень '+MsProjectApp.Application.ActiveCell.Task.OutlineParent.Text11);
                                                 if MsProjectApp.Application.ActiveCell.Task.OutlineParent.Text11=r.OutlineParent.Text11
                                                    then begin
                                                  try
                                                   MsProjectApp.Application.ActiveCell.task.TaskDependencies.Add(r);
                                                     finally
                                                              writeln(log_Out,Copy(Hard_link_text,1,4)+' !!! '+MsProjectApp.Application.ActiveCell.task.name+' уровень '+MsProjectApp.Application.ActiveCell.Task.OutlineParent.Text11+' БЕРУ!!!');
                                                  end;
                                                // r.TaskDependencies.Add(MsProjectApp.Application.ActiveCell.task);
                                                          enda:=0;
                                                    end;
                                              end
                                             else
                                               enda:=0;
                                             end; //**
                                end; //*****!
                                          end;
                                        // else writeln(log_Out,Copy(Hard_link_text,1,4)+' ! '+r.name)
                                      end;
                        end;
        end;
        k:=k+1;
   end;

 //  while not Eof(Hard_link) do
//  begin
//    ReadLn(Hard_link,Hard_link_text);    writeln(log_Out,Copy(Hard_link_text,1,1));
//    if Copy(Hard_link_text,1,1)<>';' then
//      begin
//           writeln(log_Out,':Жесткая связь !'+Copy(Hard_link_text,1,4)+' к '+Copy(Hard_link_text,6,4)+Copy(Hard_link_text,Length(Hard_link_text)-2,3));
//        if  Copy(Hard_link_text,Length(Hard_link_text)-3,3)='cer' then
//            begin
//            MsProjectApp.Application.SelectTaskField( 0,'Название',EmptyParam,EmptyParam,EmptyParam,EmptyParam,);
//            object1:=MsProjectApp.Application.FindEx('Название','содержит',Copy(Hard_link_text,1,4), True,EmptyParam,EmptyParam,EmptyParam,true);

//               if object1<>'' then
//                 begin
//                      object2:=MsProjectApp.Application.FindEx('Название','содержит',Copy(Hard_link_text,6,4), True,EmptyParam,EmptyParam,EmptyParam,true);
//                      if object2<>'' then
//                        begin
//                           MsProjectApp.Application.ActiveProject.Tasks(object2).TaskDependencies.Add(object1);
//                              writeln(log_Out,':Жесткая связь '+object2.Наименование+' к '+object1.Наименование);
//
//                        end;
//                 end;
//            end;
//      end;

 // end;
     end; ///STOPPER!!
 ////  *****Подставляю жесткие связи из текстовой таблички
      CloseFile(Log_out); // CloseFile(Hard_link);
    ShowMessage('Done! Have a look the log file');
    if CheckBox3.Checked=false then
    MsProjectApp.Application.visible:=true;
     DBGridEh1.DataSource.DataSet.Filtered:=false;
       OraQuery1.Close;

end;

end.
